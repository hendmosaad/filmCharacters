import 'package:bloc_app/business_logic/characters_cubit.dart';
import 'package:bloc_app/conestances/strings.dart';
import 'package:bloc_app/data/models/charcter_model.dart';
import 'package:bloc_app/data/repository/characters_repository.dart';
import 'package:bloc_app/data/web_services/characters_webservices.dart';
import 'package:bloc_app/persenatation/screens/character_details.dart';
import 'package:flutter/material.dart';
import 'package:bloc_app/persenatation/screens/characters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AppRouter{
 late CharactersRepository charactersRepository;
late  CharactersCubit charactersCubit;
  AppRouter(){
    charactersRepository=CharactersRepository(CharacterService());
    charactersCubit=CharactersCubit(charactersRepository);
  }
  Route  generateRoute(RouteSettings settings){
    switch (settings.name){
      case '/':
         return MaterialPageRoute(builder: (_)=>BlocProvider(
           create:(BuildContext context )=>CharactersCubit(charactersRepository),
           child: Character(),

         )) ;
      case '/character_details' :
        final characterModel=settings.arguments as CharacterModel;
        return MaterialPageRoute(builder: (_)=>CharacterDetails(characterModel: characterModel,)) ;
      default :
        return MaterialPageRoute(builder: (_)=>Character()) ;
    }

  }
}