// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_chat_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(gameChatMessagesNotifier)
final gameChatMessagesProvider = GameChatMessagesNotifierProvider._();

final class GameChatMessagesNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ChatMessage>>,
          List<ChatMessage>,
          Stream<List<ChatMessage>>
        >
    with
        $FutureModifier<List<ChatMessage>>,
        $StreamProvider<List<ChatMessage>> {
  GameChatMessagesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gameChatMessagesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gameChatMessagesNotifierHash();

  @$internal
  @override
  $StreamProviderElement<List<ChatMessage>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<ChatMessage>> create(Ref ref) {
    return gameChatMessagesNotifier(ref);
  }
}

String _$gameChatMessagesNotifierHash() =>
    r'd2d092946564c282d74bbda3365306f9a0225535';
