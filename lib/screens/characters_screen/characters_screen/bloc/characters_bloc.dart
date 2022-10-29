import 'package:bloc/bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_test_app/GraphQL/graphQL_requester.dart';
import 'package:rick_and_morty_test_app/GraphQL/qraphql_queries.dart';
import 'package:rick_and_morty_test_app/model/characters_model.dart';
import 'package:rick_and_morty_test_app/screens/characters_screen/characters_screen/bloc/characters_repository.dart';
part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc() : super(CharactersInitial()) {
    on<GetCharactersEvent>(
      (event, emit) async {
        emit(LoadingCharactersState());
        try {
          List<CharactersModel> charactersModel = await CharactersRepository()
              .getCharacters(query: GraphQLQueries.getCharacterQuery);
          emit(
            LoadedCharactersState(charactersModel: charactersModel),
          );
        } catch (exceptionError) {
          emit(
            ErrorCharactersState(message: exceptionError.toString()),
          );
        }
      },
    );
  }
}
