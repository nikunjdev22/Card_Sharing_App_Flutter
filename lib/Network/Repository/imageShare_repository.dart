import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/string_constants.dart';

/**
 * Created by Nikunj Chitroda.
 * Created on 23/12/22 at 11:42 AM.
 */

class ImageShareRepository {

  static Future shareImage(String imgURL,String text) async {
    final url = Uri.parse(imgURL);
    final response = await http.get(url);
    final bytes = response.bodyBytes;
    final temp = await getTemporaryDirectory();
    final path = '${temp.path}/image.jpg';
    File(path).writeAsBytesSync(bytes);
    await Share.shareFiles([path],subject: 'Celebration Card',text: "${text} ${appShareMessage}" );
  }

  getMessage() async {
    final prefs = await SharedPreferences.getInstance();
    String? customquotes = prefs.getString(KEY_USER_MESSAGE)!;
    print("Custom Message :- ${customquotes}");
  }
}
