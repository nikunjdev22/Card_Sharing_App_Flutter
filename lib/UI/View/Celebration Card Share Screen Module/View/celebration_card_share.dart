/**
 * Created by Nikunj Chitroda.
 * Created on 23/12/22 at 11:11 AM.
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:celebration_card/UI/View/Celebration%20Card%20Share%20Screen%20Module/View%20Model/celebration_card_share_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../Config/Services/network_manager.dart';
import '../../../../Utils/string_constants.dart';
import '../../Something Went Wrong Module/View/something_went_wrong.dart';


class CelebrationCardShare extends StatefulWidget {
  String imageURL;
  int imageId;
  CelebrationCardShare({Key? key,required this.imageURL,required this.imageId}) : super(key: key);

  @override
  State<CelebrationCardShare> createState() => _CelebrationCardShareState();
}

class _CelebrationCardShareState extends State<CelebrationCardShare> with WidgetsBindingObserver {
  Uint8List? bytes;
  final imageShareViewModel = Get.find<ImageShareViewModel>();
  final GetXNetworkManager networkManager = Get.find<GetXNetworkManager>();

  RxString customMessage = "".obs;

  @override
  void initState() {
    getMessage();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<GetXNetworkManager>(
          builder: (builder) => networkManager.connectionType == 0
              ? const SomethingWentWrong()
              : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(imageScreenTitle),
              actions: [
                IconButton(
                  onPressed: () async {
                    imageShareViewModel.getImage(widget.imageURL);
                  },
                  icon: Icon(Icons.share),
                )
              ],
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.zero,
                  child: celebrationCard(),
                ),
              ],
            ),
          )
        ),

    );
  }

  Widget celebrationCard() {
    return  Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Hero(tag: '${widget.imageId}',child: Image(image: CachedNetworkImageProvider(widget.imageURL))),
      ],
    );
  }

  getMessage() async {
    final prefs = await SharedPreferences.getInstance();
    String? customquotes = prefs.getString(KEY_USER_MESSAGE)!;
    customquotes = customMessage.value;
    print("Default Custom Message :- ${customquotes       }");
    print("Custom Message :- ${customMessage.value}");
  }

}
