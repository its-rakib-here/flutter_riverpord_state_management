import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tickerProvider=StreamProvider((_)=>
    Stream.periodic(const Duration(seconds: 1),(count)=>count)
);


class TemerScreen extends ConsumerWidget {
  const TemerScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final tickAsync=ref.watch(tickerProvider);
    

    return Scaffold(
      appBar: AppBar(
        title: Text("Live Timer"),
      ),
      body: Center(
        child: tickAsync.when(data: (count)=>Text("Second elapsed:$count"),
            error: (error,_)=>(Text ("error")),
            loading: ()=>CircularProgressIndicator()),
      ),
    );
  }
}
