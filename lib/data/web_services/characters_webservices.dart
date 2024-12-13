import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CharacterService {
  static Dio ? dio;

  CharacterService() {
    dio = Dio(
        BaseOptions(
            baseUrl: "https://rickandmortyapi.com/api",
            receiveDataWhenStatusError: true
        )
    );
  }
 Future <List<dynamic>>getCharacters()async{
   try{
     Response response= await dio!.get("/character");
     return response.data["results"];
   }
    catch(e){
     print(e);
return [];
    }
  }
}