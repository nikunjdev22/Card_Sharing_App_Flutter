/**
 * Created by Nikunj Chitroda.
 * Created on 23/12/22 at 1:06 PM.
 */

import 'package:flutter/material.dart';

import '../../../../Utils/string_constants.dart';
import '../../../Custom Widget/customImageContainer.dart';
import '../../../Custom Widget/customTextContainer.dart';

class SomethingWentWrong extends StatefulWidget {
  const SomethingWentWrong({Key? key,}) : super(key: key);
  @override
  State<SomethingWentWrong> createState() => _SomethingWentWrongState();
}

class _SomethingWentWrongState extends State<SomethingWentWrong> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: customImageContainer(noInternetImage2,context),
            ),
            customTextContainer(context,pleaseTryAgain),
          ],
        ),
      ),
    );
  }
}
