import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

void main() {
  runApp (ProviderScope(child: const MyApp()));
}


final staticProvider=Provider((Ref ref){

  return "Hello";
});




class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final result =ref.watch(staticProvider);
    return Scaffold(
      body: Center(
        child: Text(result),
      ),
    )


    ;
  }
}
