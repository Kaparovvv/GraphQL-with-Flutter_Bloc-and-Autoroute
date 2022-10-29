import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLRequester {
  static HttpLink httpLink = HttpLink('https://rickandmortyapi.com/graphql');
  static GraphQLClient client = GraphQLClient(
    cache: GraphQLCache(),
    link: httpLink,
  );
}
