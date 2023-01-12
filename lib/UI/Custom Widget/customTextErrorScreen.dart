import 'package:flutter/material.dart';

/**
 * Created by Nikunj Chitroda.
 * Created on 23/12/22 at 1:16 PM.
 */

Widget customTextErrorScreen(String text) {
  return Text(
    text,
    maxLines: 4,
    textAlign: TextAlign.center,
    style: const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 30,
      color: Color(0xff2f3640),
    ),
  );
}
