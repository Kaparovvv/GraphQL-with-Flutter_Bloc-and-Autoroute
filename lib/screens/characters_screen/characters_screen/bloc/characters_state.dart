part of 'characters_bloc.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class LoadingCharactersState extends CharactersState {}

class LoadedCharactersState extends CharactersState {
  final List<CharactersModel> charactersModel;

  LoadedCharactersState({required this.charactersModel});
}

class ErrorCharactersState extends CharactersState {
  final String message;

  ErrorCharactersState({required this.message});
}
