import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_and_morty_test_app/GraphQL/graphQL_requester.dart';
import 'package:rick_and_morty_test_app/model/characters_model.dart';

class CharactersProvider {
  Future<List<CharactersModel>> getCharacters({
    String? query,
  }) async {
    OperationException? exceptionError;
    final QueryResult result = await GraphQLRequester.client.query(
      QueryOptions(
        document: gql(query ?? ''),
        fetchPolicy: FetchPolicy.cacheAndNetwork,
      ),
    );
    if (result.hasException) {
      exceptionError = result.exception;
    }
    List<CharactersModel> characters = result.data?['characters']?['results']
        .map<CharactersModel>((element) => CharactersModel.fromJson(element))
        .toList();
    return characters;
  }
}
