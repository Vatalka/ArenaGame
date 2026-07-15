import 'package:arena_game/features/battle/domain/entities/battle_selection.dart';
import 'package:arena_game/features/battle/presentation/controllers/battle_notifier.dart';
import 'package:arena_game/features/battle/presentation/controllers/bot_notifier.dart';
import 'package:arena_game/features/battle/presentation/controllers/player_notifier.dart';
import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/domain/repositories/i_character_repository.dart';
import 'package:arena_game/features/character/presentation/controllers/selection_notifier.dart';
import 'package:arena_game/features/log/domain/entities/battle_log_item.dart';
import 'package:arena_game/features/log/presentation/controllers/battle_log_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class FakeBotNotifier extends BotNotifier {
  @override
  Character build() => Character.createNew().copyWith(
    name: 'Тест Бот',
    strength: 5,
    vitality: 10,
    isInCombat: true,
  );

  @override
  void takeDamage(int damage) {
    state = state.copyWith(
      currentHp: (state.currentHp - damage).clamp(0, state.maxHp),
    );
  }

  @override
  Area getTestArea() => Area.head;

  @override
  Area getRandomArea() => Area.body;
}

class FakeBattleLogNotifier extends BattleLogNotifier {
  @override
  List<BattleLogItem> build() => [];

  @override
  void addStartBattleLog(String playerName, String botName) {}

  @override
  void addRoundLog(int round) {}

  @override
  void addAttackLog(String attackerName, Area area, int damage) {}

  @override
  void addBlockLog(String defenderName, Area area) {}

  @override
  void addEndBattleLog(BattleResult result, String winnerName) {}

  @override
  void addInfoLog(String message) {}
}

class MockCharacterRepository extends Mock implements ICharacterRepository {}

final testPlayer = Character.createNew().copyWith(
  id: 'player-1',
  name: 'Тест Гравець',
  strength: 5,
  vitality: 10,
  currentHp: 100,
  isInCombat: false,
  lastUpdateTime: DateTime.now().millisecondsSinceEpoch,
);

class FakePlayerNotifier extends PlayerNotifier {
  @override
  String build() => 'player-1';
}

void main() {
  setUpAll(() {
    registerFallbackValue(Character.createEmpty());
  });

  late MockCharacterRepository mockRepository;
  late ProviderContainer container;

  setUp(() async {
    mockRepository = MockCharacterRepository();

    when(
      () => mockRepository.getAllCharacters(),
    ).thenAnswer((_) async => [testPlayer]);
    when(() => mockRepository.saveCharacter(any())).thenAnswer((_) async {});

    container = ProviderContainer(
      overrides: [
        characterRepositoryProvider.overrideWithValue(mockRepository),
        botProvider.overrideWith(() => FakeBotNotifier()),
        battleLogProvider.overrideWith(() => FakeBattleLogNotifier()),
        playerProvider.overrideWith(() => FakePlayerNotifier()),
      ],
    );

    await container.read(selectionProvider.future);

    container
        .read(selectionProvider.notifier)
        .setCombatState(id: 'player-1', isInCombat: false);

    clearInteractions(mockRepository);
  });

  tearDown(() => container.dispose());

  group('enableBotMode', () {
    test('виставляє isBotMode: true і скидає вибір зон', () {
      container.read(battleProvider.notifier).enableBotMode();

      final state = container.read(battleProvider);
      expect(state.isBotMode, true);
      expect(state.selectedAttack, isNull);
      expect(state.selectedBlock, isNull);
    });
  });

  group('disableBotMode', () {
    test('guard: якщо isBotMode вже false — нічого не відбувається', () {
      container.read(battleProvider.notifier).disableBotMode();

      final state = container.read(battleProvider);
      expect(state.isBotMode, false);

      verifyNever(() => mockRepository.saveCharacter(any()));
    });

    test('після enableBotMode скидає isBotMode назад в false', () {
      container.read(battleProvider.notifier).enableBotMode();
      container.read(battleProvider.notifier).disableBotMode();

      expect(container.read(battleProvider).isBotMode, false);
    });
  });

  group('confirmTurn', () {
    setUp(() {
      container.read(battleProvider.notifier).enableBotMode();
    });

    test('guard: без isBotMode нічого не робить', () {
      container.read(battleProvider.notifier).disableBotMode();

      final roundBefore = container.read(battleProvider).roundNumber;
      container.read(battleProvider.notifier).confirmTurn();

      expect(container.read(battleProvider).roundNumber, roundBefore);
    });

    test('після підтвердження ходу roundNumber збільшується на 1', () {
      container.read(battleProvider.notifier)
        ..selectAttack(Area.head)
        ..selectBlock(Area.body)
        ..confirmTurn();

      expect(container.read(battleProvider).roundNumber, 1);
    });

    test('після підтвердження ходу вибір зон скидається', () {
      container.read(battleProvider.notifier)
        ..selectAttack(Area.head)
        ..selectBlock(Area.body)
        ..confirmTurn();

      final state = container.read(battleProvider);
      expect(state.selectedAttack, isNull);
      expect(state.selectedBlock, isNull);
    });

    test('бот отримує шкоду після ходу гравця', () {
      final botHpBefore = container.read(botProvider).currentHp;

      container.read(battleProvider.notifier)
        ..selectAttack(Area.body) // бот блокує head → body пройде
        ..selectBlock(Area.head)
        ..confirmTurn();

      final botHpAfter = container.read(botProvider).currentHp;
      expect(botHpAfter, lessThan(botHpBefore));
    });
  });
}
