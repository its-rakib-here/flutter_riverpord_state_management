import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpord/Future_provider/Greeting.dart';

final greetingAsyncProvider = AsyncNotifierProvider<GreetingsNotifier, String>(
  () => GreetingsNotifier(),
);

class GreetingsNotifier extends AsyncNotifier<String> {
  @override
  FutureOr<String> build() async {
    return await ref.read(FakeApiProvider).fetchGreeting();
  }

  Future<void> refreshGretting() async {
    try {
      state = const AsyncValue.loading();
      final value = await ref.read(FakeApiProvider).fetchGreeting();
      state = AsyncData(value);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
