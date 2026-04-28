import 'dart:math';

class FakeApi {
  Future<String>fetchGreeting()async{
    await Future.delayed(const Duration(seconds: 2));
    if(Random().nextDouble()<0.3){
      throw Exception(
        "Failed to fetch greetingg"
      );
    }
    return "Hello from async";
  }
}