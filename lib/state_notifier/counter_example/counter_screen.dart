import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpord/state_notifier/counter_example/counter_provider_controller.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final count=ref.watch(counterProvider);
    final ctrl=ref.read(counterProvider.notifier);


    return Scaffold(
      appBar: AppBar(
        title: Text("Counter: "),
      ),
      body: Center(
        child: Text("Count value :$count "),
      ),

      floatingActionButton: Row(

        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: ctrl.decrement,child: Icon(Icons.remove),),
          SizedBox(width: 12,),
          FloatingActionButton(onPressed: ctrl.increment,child: Icon(Icons.add),),
          SizedBox(width: 12,),

          FloatingActionButton(onPressed: ctrl.reset,child: Icon(Icons.refresh),),

        ],
      ),
    );
  }
}
