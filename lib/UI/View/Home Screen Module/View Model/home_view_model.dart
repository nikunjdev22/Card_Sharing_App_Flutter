/**
 * Created by Nikunj Chitroda.
 * Created on 21/12/22 at 5:12 PM.
 */

import 'package:celebration_card/Data/Remote/Response/Home%20Screen%20Response/home_data_response.dart';
import 'package:celebration_card/Network/Repository/home_repository.dart';
import 'package:get/get.dart';

class HomeViewModel extends FullLifeCycleController {
  var imageList = <HomeModel>[].obs;
  var isLoading = true.obs;
  var onError = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllData();
  }

  Future<void> getAllData() async {
    var imageData = await HomeRepository.fetchAllHomeData();
    if (imageData != null) {
      isLoading.value = false;
      imageList.value = imageData;
    } else {
      isLoading.value = false;
      onError.value = true;
    }
  }
}
