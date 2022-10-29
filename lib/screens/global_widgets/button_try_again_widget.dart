import 'package:flutter/material.dart';
import 'package:rick_and_morty_test_app/commons/text_styles_helper.dart';

class ButtonTryAgainWidget extends StatelessWidget {
  final Function() onPressed;
  const ButtonTryAgainWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: Text(
        'Try Again',
        style: TextStylesHelper.nameCharacter,
      ),
    );
  }
}
