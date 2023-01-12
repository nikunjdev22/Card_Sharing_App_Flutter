/**
 * Created by Nikunj Chitroda.
 * Created on 21/12/22 at 4:39 PM.
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:celebration_card/Config/Services/network_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../Utils/string_constants.dart';
import '../../Celebration Card Share Screen Module/View/celebration_card_share.dart';
import '../../Something Went Wrong Module/View/something_went_wrong.dart';
import '../View Model/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver{
  final homeViewModel = Get.find<HomeViewModel>();
  final GetXNetworkManager networkManager = Get.find<GetXNetworkManager>();

  int gridCount = 2;

  double cardRadius = 12;
  double cardElevation = 16;

  double verticalPadding = 4.0;
  double horizontalPadding = 2.0;

  TextEditingController message = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<GetXNetworkManager>(
          builder: (builder) => networkManager.connectionType == 0
              ? const SomethingWentWrong()
              : Scaffold(
            appBar: AppBar(
              title: const Text(homeScreenTitle),
              actions: [
                IconButton(
                    onPressed: () async {
                      _displayTextInputDialog(context);
                    },
                    icon: Icon(Icons.message)),
              ],
              centerTitle: true,
            ),
            body: Obx(() => homeViewModel.isLoading.value == true
                ? commonLoader()
                : imageCard(context)),
          )
        ),
    );
  }

  Widget imageCard(BuildContext context) {
    return GridView.builder(
      itemCount: homeViewModel.imageList.length,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding, horizontal: horizontalPadding),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: gridCount, childAspectRatio: (1 / 1)
      ),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Expanded(
              child: InkWell(
                child: Card(
                  elevation: cardElevation,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(cardRadius)),
                  child: Hero(
                    tag: '${homeViewModel.imageList[index].id.toString()}',
                    child: CachedNetworkImage(
                      imageUrl:
                          homeViewModel.imageList[index].image_url.toString(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                onTap: () {
                  Get.to(() => CelebrationCardShare(
                        imageURL:
                            homeViewModel.imageList[index].image_url.toString(),
                        imageId: homeViewModel.imageList[index].id!.toInt(),
                      ));
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget commonLoader() {
    return const Center(child: CircularProgressIndicator());
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => StatefulBuilder(
            builder: (context, setState) => AlertDialog(
                  title: Text(messageTitle),
                  content: TextField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    controller: message,
                    decoration: InputDecoration(hintText: messageHintText),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text(cancel),
                      onPressed: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                    ),
                    TextButton(
                      child: Text(ok),
                      onPressed: () async {
                        setCustomMessage();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )));
  }

  setCustomMessage() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(KEY_USER_MESSAGE, message.text);
  }
}
