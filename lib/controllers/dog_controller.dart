import 'dart:convert';

import 'package:dog_flutter_application/constants/app_constants.dart';
import 'package:dog_flutter_application/models/dog.dart';
import 'package:http/http.dart' as http;

class DogController {
  static final DogController instance = DogController();

  Future<Dog> getRandomDog() async{
    http.Response response = await http.get(
      Uri.parse(appConstants['dogApiUrl']),
      headers: <String, String>{
      'Content-Type': 'application/json'
      } 
    );

    if(response.statusCode == 200){
      return Dog.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Falha ao buscar usuário!');
    }
  }

  
}