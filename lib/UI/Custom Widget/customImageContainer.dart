/**
 * Created by Nikunj Chitroda.
 * Created on 23/12/22 at 1:13 PM.
 */

import 'package:flutter/material.dart';

import 'customImageLoad.dart';

Widget customImageContainer(String imagePath, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      imageLoad(imagePath),
    ],
  );
}
