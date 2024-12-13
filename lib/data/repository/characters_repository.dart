import 'package:bloc_app/data/models/charcter_model.dart';
import 'package:bloc_app/data/web_services/characters_webservices.dart';
import 'package:dio/dio.dart';

class CharactersRepository{
   final CharacterService characterService ;

   CharactersRepository(this.characterService);
   Future <List<CharacterModel>>getCharacters()async{
  final characters= await characterService.getCharacters();
  return characters.map((character)=>CharacterModel.fromJson(character)).toList();
   }
}