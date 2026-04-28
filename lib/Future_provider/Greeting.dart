import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpord/Future_provider/fake_api.dart';

final FakeApiProvider = Provider((_)=>FakeApi());


final gteetingFutureProvider=FutureProvider((Ref ref) async {

  final service=ref.read(FakeApiProvider);
  return await service.fetchGreeting();
});



class Greeting extends ConsumerWidget {
  const Greeting({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    
    final greetingAsync=ref.watch(gteetingFutureProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Asynch greeting"),

      ),
      body: Center(
        child: greetingAsync.when(data: (greeting)=>Text(greeting),
            error: (error, stackTrace)=>(Text(error.toString())),
            loading: ()=>CircularProgressIndicator()),
      ),
    );
  }
}

