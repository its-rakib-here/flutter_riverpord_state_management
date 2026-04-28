import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/legacy.dart';

final textProvider=StateProvider((Ref ref){
  return "";
});



class StatefullProvider extends ConsumerStatefulWidget {
  const StatefullProvider({super.key});

  @override
  ConsumerState<StatefullProvider> createState() => _StatefullProviderState();
}

class _StatefullProviderState extends ConsumerState<StatefullProvider> {
  late final TextEditingController _controller;

  @override
  void initState(){
    super.initState();
    _controller =TextEditingController();
    _controller.addListener((){
      ref.read(textProvider.notifier).state=_controller.text;
    });
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

        final text=ref.watch(textProvider);


    return Scaffold(
      appBar: AppBar(
        title: Text("Form Field"),
        backgroundColor: Colors.indigo,
      ),
      
      body: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: (
        Column(
          children: [
            TextFormField(controller: _controller,),
            SizedBox(height: 30,),
            Text("You Typed: $text"),
          ],
        )
        ),
      ),
      
    );
  }
}
