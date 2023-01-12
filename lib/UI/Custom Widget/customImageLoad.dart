/**
 * Created by Nikunj Chitroda.
 * Created on 23/12/22 at 1:17 PM.
 */

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as p;

import '../../Utils/string_constants.dart';

///Image Function
Widget imageLoad(String? imgPath) {
  String? extImg;
  //check the imgPath
  if (imgPath?.isNotEmpty==true) {
    extImg = p.extension(imgPath!);
    if (imgPath.isURL) {
      if (extImg!.toLowerCase() == '.svg') {
        return SvgPicture.network(
          imgPath,
          placeholderBuilder: (context) {
            return Image.asset(placeHolder);
          },
        );
      } else {
        return imageLoader(imgPath);
      }
    } else {
      if (extImg!.toLowerCase() == '.svg') {
        return SvgPicture.asset(imgPath);
      } else {
        return Image.asset(imgPath);
      }
    }
  } else {
    return Image.asset(placeHolder);
  }
}

///Image Loader
Image imageLoader(String imgPath) {
  return Image.network(imgPath,
    loadingBuilder: (context, child, loadingProgress) {
      if (loadingProgress == null) {
        return child;
      } else {
        return const CircularProgressIndicator();
      }
    },
    errorBuilder: (context, error, stackTrace) {
      return Image.asset(placeHolder);
    },
  );
}
