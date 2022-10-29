// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../screens/characters_screen/characters_screen/characters_screen.dart'
    as _i1;
import '../screens/characters_screen/info_character_screen/info_character_screen.dart'
    as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    CharactersScreen.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.CharactersScreen(),
      );
    },
    InfoCharacterScreen.name: (routeData) {
      final args = routeData.argsAs<InfoCharacterScreenArgs>(
          orElse: () => const InfoCharacterScreenArgs());
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.InfoCharacterScreen(
          key: args.key,
          imageUrl: args.imageUrl,
          name: args.name,
          isAlive: args.isAlive,
          gender: args.gender,
          species: args.species,
          origin: args.origin,
          location: args.location,
        ),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'characters',
          fullMatch: true,
        ),
        _i3.RouteConfig(
          CharactersScreen.name,
          path: 'characters',
        ),
        _i3.RouteConfig(
          InfoCharacterScreen.name,
          path: 'infoCharacters',
        ),
      ];
}

/// generated route for
/// [_i1.CharactersScreen]
class CharactersScreen extends _i3.PageRouteInfo<void> {
  const CharactersScreen()
      : super(
          CharactersScreen.name,
          path: 'characters',
        );

  static const String name = 'CharactersScreen';
}

/// generated route for
/// [_i2.InfoCharacterScreen]
class InfoCharacterScreen extends _i3.PageRouteInfo<InfoCharacterScreenArgs> {
  InfoCharacterScreen({
    _i4.Key? key,
    String? imageUrl,
    String? name,
    String? isAlive,
    String? gender,
    String? species,
    String? origin,
    String? location,
  }) : super(
          InfoCharacterScreen.name,
          path: 'infoCharacters',
          args: InfoCharacterScreenArgs(
            key: key,
            imageUrl: imageUrl,
            name: name,
            isAlive: isAlive,
            gender: gender,
            species: species,
            origin: origin,
            location: location,
          ),
        );

  static const String name = 'InfoCharacterScreen';
}

class InfoCharacterScreenArgs {
  const InfoCharacterScreenArgs({
    this.key,
    this.imageUrl,
    this.name,
    this.isAlive,
    this.gender,
    this.species,
    this.origin,
    this.location,
  });

  final _i4.Key? key;

  final String? imageUrl;

  final String? name;

  final String? isAlive;

  final String? gender;

  final String? species;

  final String? origin;

  final String? location;

  @override
  String toString() {
    return 'InfoCharacterScreenArgs{key: $key, imageUrl: $imageUrl, name: $name, isAlive: $isAlive, gender: $gender, species: $species, origin: $origin, location: $location}';
  }
}
