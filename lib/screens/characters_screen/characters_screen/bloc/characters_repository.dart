import 'package:rick_and_morty_test_app/model/characters_model.dart';
import 'package:rick_and_morty_test_app/screens/characters_screen/characters_screen/bloc/characters_provider.dart';

class CharactersRepository {
  Future<List<CharactersModel>> getCharacters({String? query}) async {
    CharactersProvider charactersProvider = CharactersProvider();

    return charactersProvider.getCharacters(query: query);
  }
}
