import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpord/Future_provider/Greeting.dart';
import 'package:riverpord/async_notifier/async_screen.dart';
import 'package:riverpord/state_notifier/counter_example/counter_screen.dart';
import 'package:riverpord/state_provider/state_provider.dart';
import 'package:riverpord/statefull_consumer_widget/statefull_provider.dart';
import 'package:riverpord/stream_provider/stream_provider.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

final staticProvider = Provider<String>((ref) {
  return "Hello";
});

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(staticProvider);

    return MaterialApp(
      home: AsyncScreen(

      ),
    );
  }
}