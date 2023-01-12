import 'package:get/get.dart';

import '../../Config/Services/network_manager.dart';
import '../../UI/View/Celebration Card Share Screen Module/View Model/celebration_card_share_view_model.dart';
import '../../UI/View/Home Screen Module/View Model/home_view_model.dart';


class NetworkBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<HomeViewModel>(() => HomeViewModel(),fenix: true);
    Get.lazyPut<ImageShareViewModel>(() => ImageShareViewModel(),fenix: true);
    Get.lazyPut<GetXNetworkManager>(() => GetXNetworkManager());
  }
}