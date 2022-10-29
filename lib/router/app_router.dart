import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty_test_app/screens/characters_screen/characters_screen/characters_screen.dart';
import 'package:rick_and_morty_test_app/screens/characters_screen/info_character_screen/info_character_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: 'characters', page: CharactersScreen, initial: true),
    AutoRoute(path: 'infoCharacters', page: InfoCharacterScreen),
  ],
)
class $AppRouter {}
