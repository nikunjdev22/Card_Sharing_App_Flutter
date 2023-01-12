/**
 * Created by Nikunj Chitroda.
 * Created on 21/12/22 at 5:57 PM.
 */

class HomeModel {

  int? id;
  String? image_url;


  HomeModel({this.id,this.image_url});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json['id'],
      image_url: json['image_url'],
    );
  }
}