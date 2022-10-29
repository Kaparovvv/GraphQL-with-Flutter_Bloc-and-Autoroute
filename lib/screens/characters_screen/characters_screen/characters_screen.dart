import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_and_morty_test_app/model/characters_model.dart';
import 'package:rick_and_morty_test_app/router/app_router.gr.dart';
import 'package:rick_and_morty_test_app/screens/characters_screen/characters_screen/bloc/characters_bloc.dart';
import 'package:rick_and_morty_test_app/screens/characters_screen/characters_screen/local_widgets/box_character_data_widget.dart';
import 'package:rick_and_morty_test_app/screens/global_widgets/button_try_again_widget.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late CharactersBloc _charactersBloc;

  late Box characters;

  @override
  void initState() {
    characters = Hive.box('charactersBox');
    _charactersBloc = CharactersBloc();
    _charactersBloc.add(GetCharactersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, top: 66.h, right: 16.w),
        child: BlocConsumer<CharactersBloc, CharactersState>(
          bloc: _charactersBloc,
          listener: (context, state) {
            if (state is ErrorCharactersState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is LoadingCharactersState) {
              const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is ErrorCharactersState) {
              return Center(
                child: ButtonTryAgainWidget(
                  onPressed: () => _charactersBloc.add(GetCharactersEvent()),
                ),
              );
            }

            if (state is LoadedCharactersState) {
              return ListView.separated(
                itemCount: state.charactersModel.length,
                itemBuilder: (context, index) {
                  CharactersModel characters = state.charactersModel[index];
                  return BoxCharacterDataWidget(
                    imageUrl: characters.image,
                    name: characters.name,
                    gender: characters.gender,
                    isAlive: characters.status,
                    species: characters.species,
                    function: () {
                      context.router.push(
                        InfoCharacterScreen(
                          imageUrl: characters.image,
                          name: characters.name,
                          isAlive: characters.status,
                          species: characters.species,
                          gender: characters.gender,
                          origin: characters.origin!.name,
                          location: characters.location!.name,
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: 24.h,
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
