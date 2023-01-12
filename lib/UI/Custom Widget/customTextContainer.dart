/**
 * Created by Nikunj Chitroda.
 * Created on 23/12/22 at 1:13 PM.
 */
import 'package:flutter/material.dart';

Widget customTextContainer(BuildContext context, String text) {
  return Container(
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).size.height/3,
      bottom: 0,
      left: MediaQuery.of(context).size.width/10,
      right: MediaQuery.of(context).size.width/10,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:  [
        Text("")
      ],
    ),
  );
}