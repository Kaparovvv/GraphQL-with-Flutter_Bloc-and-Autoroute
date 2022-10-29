import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_test_app/commons/colors_helper.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;
  final BoxFit? boxFit;
  const CustomCachedNetworkImage({
    Key? key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.boxFit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CachedNetworkImage(
        imageUrl: imageUrl ??
            'https://avatars.mds.yandex.net/i?id=b6b0de530521e05e66a74e853aed96c6-5869993-images-thumbs&n=13',
        imageBuilder: (context, imageProvider) => SizedBox(
          width: width,
          height: height,
          child: ClipRRect(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Image.network(
                imageUrl ??
                    'https://avatars.mds.yandex.net/i?id=b6b0de530521e05e66a74e853aed96c6-5869993-images-thumbs&n=13',
                fit: boxFit ?? BoxFit.none,
              ),
            ),
          ),
        ),
        // Container(
        //   width: width,
        //   height: height,
        //   decoration: BoxDecoration(
        //     borderRadius: borderRadius,
        //     image: DecorationImage(
        //       image: imageProvider,
        //       fit: boxFit,
        //     ),
        //     shape: boxShape ?? BoxShape.rectangle,
        //   ),
        // ),
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => SizedBox(
          width: width,
          height: height,
          child: Icon(
            Icons.error,
            color: ColorsHelper.gray3,
          ),
        ),
      ),
    );
  }
}
