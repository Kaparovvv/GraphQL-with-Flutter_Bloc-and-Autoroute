class GraphQLQueries{
    static const getCharacterQuery = """
        query{
        characters{
          results{
            image
            name
            status
            gender
            species
            location{
              name
            }
            origin{
              name
            }
          }
        }
      }
""";
}