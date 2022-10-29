import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_test_app/commons/colors_helper.dart';
import 'package:rick_and_morty_test_app/commons/descriptions_helper.dart';
import 'package:rick_and_morty_test_app/commons/text_styles_helper.dart';
import 'package:rick_and_morty_test_app/screens/characters_screen/info_character_screen/local_widgets/name_value_widget.dart';
import 'package:rick_and_morty_test_app/screens/global_widgets/character_isalive_widget.dart';
import 'package:rick_and_morty_test_app/screens/global_widgets/circle_cashed_network_image_widget.dart';
import 'package:rick_and_morty_test_app/screens/global_widgets/customCachedNetworkImage_widget.dart';

class InfoCharacterScreen extends StatelessWidget {
  final String? imageUrl;
  final String? name;
  final String? isAlive;
  final String? gender;
  final String? species;
  final String? origin;
  final String? location;
  const InfoCharacterScreen({
    Key? key,
    this.imageUrl,
    this.name,
    this.isAlive,
    this.gender,
    this.species,
    this.origin,
    this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              CustomCachedNetworkImage(
                imageUrl: imageUrl,
                width: 1.sw,
                height: 218.h,
                boxFit: BoxFit.cover,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 138.h),
                  child: Container(
                    width: 150.w,
                    height: 150.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Center(
                      child: CircleCachedNetworkImageWidget(
                        imageUrl: imageUrl ?? 'unknown',
                        width: 120.w,
                        height: 146.h,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              top: 24.h,
              right: 16.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    name ?? 'unknown',
                    textAlign: TextAlign.center,
                    style: TextStylesHelper.nameInfoCharacter,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: 4.h),
                Center(
                  child: CharacterAliveOrDead(
                    alive: isAlive,
                  ),
                ),
                SizedBox(height: 36.h),
                Text(
                  Descritions.character,
                  style: TextStylesHelper.descriptionStyle,
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    NameValueWidget(
                      name: 'Пол',
                      value: gender,
                      isIconButton: false,
                      onPressed: () {},
                    ),
                    SizedBox(width: 118.w),
                    NameValueWidget(
                      name: 'Расса',
                      value: species,
                      isIconButton: false,
                      onPressed: () {},
                    )
                  ],
                ),
                SizedBox(height: 20.h),
                NameValueWidget(
                  name: 'Место рождения',
                  value: origin,
                  onPressed: () {},
                ),
                SizedBox(height: 24.h),
                NameValueWidget(
                  name: 'Местоположение',
                  value: location,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 36.h),
          Divider(
            color: ColorsHelper.gray6,
            thickness: 2.h,
          ),
        ],
      ),
    );
  }
}
