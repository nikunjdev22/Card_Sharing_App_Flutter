


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/colors_constants.dart';

SnackbarController customSnackbar(String message){
  return Get.rawSnackbar(
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.deepOrange,
    snackStyle: SnackStyle.FLOATING,
    messageText: Text(message,style: TextStyle(color: Colors.white,fontFamily: 'Roboto'),),
  );
}