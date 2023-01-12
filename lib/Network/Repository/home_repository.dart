import 'dart:convert';

import 'package:celebration_card/Network/APIs/http_constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../Data/Remote/Response/Home Screen Response/home_data_response.dart';
import '../../UI/Custom Widget/common_snackBar.dart';
import '../NetworkHandler/custom_dio.dart';

/**
 * Created by Nikunj Chitroda.
 * Created on 21/12/22 at 5:10 PM.
 */

class HomeRepository{
  static var customDio = CustomDio();
  static var client;

  static Future<List<HomeModel>?> fetchAllHomeData() async{
    try {
      client = await customDio.getDio();
      var response = await client.get(baseUrl);
      if(response.statusCode == 200) {
        return List<HomeModel>.from(json.decode(response.data).map((x) => HomeModel.fromJson(x)));
      } else {
        return List<HomeModel>.empty();
      }
    } catch (error, stacktrace) {
      if (error is DioError) {
        if (error.response != null) {
          print("Exception occurred: ${error.response}");
          customSnackbar("${error.response!.data['message']}");
          return List<HomeModel>.empty();
        }
      }
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      return List<HomeModel>.empty();
    }
  }
}