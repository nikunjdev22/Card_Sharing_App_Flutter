/**
 * Created by Nikunj Chitroda.
 * Created on 23/12/22 at 11:48 AM.
 */

import 'package:celebration_card/Utils/string_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../Network/Repository/imageShare_repository.dart';

class ImageShareViewModel extends FullLifeCycleController {

  var isLoading = true.obs;
  var onError = false.obs;
  String? customquotes;

  @override
  void onInit() {
    getMessage();
    super.onInit();
  }

  Future<void> getImage(String imgURL) async {
    var url = Uri.parse(imgURL);
    var imageData = await ImageShareRepository.shareImage(url.toString(),customquotes.toString());

    if (imageData != null) {
      isLoading.value = false;
    } else {
      isLoading.value = false;
      onError.value = true;
    }
  }

  getMessage() async {
    final prefs = await SharedPreferences.getInstance();
    customquotes = prefs.getString(KEY_USER_MESSAGE)!;
    print("Custom Message :- ${customquotes}");
  }
}
