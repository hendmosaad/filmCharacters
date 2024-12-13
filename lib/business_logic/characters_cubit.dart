import 'package:bloc/bloc.dart';
import 'package:bloc_app/data/models/charcter_model.dart';
import 'package:bloc_app/data/repository/characters_repository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());
  List<CharacterModel> characterModel=[];
  List<CharacterModel> getAllCharacters(){
    charactersRepository.getCharacters().then((characters){
      emit(CharactersLoaded(characters));
      this.characterModel=characters;

    });
    return characterModel;
  }
}
