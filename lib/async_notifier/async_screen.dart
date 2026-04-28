import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpord/async_notifier/async_notifire.dart';

class AsyncScreen extends ConsumerWidget {
  const AsyncScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greetingAynch = ref.watch(greetingAsyncProvider);
    final greetingAsynchNotifier = ref.watch(greetingAsyncProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text("async")),
      body: Center(

          child: greetingAynch.when(data: (g) => Text(g),
              error: (e, _) => Text("error: $e"),
              loading: () => CircularProgressIndicator()),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          greetingAsynchNotifier.refreshGretting();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
