// import 'dart:convert';

class WasteContainer{
  String location;

  WasteContainer(String location){
    this.location = location;
  }
  WasteContainer.fromJson(Map<String, dynamic> json){
    this.location = json['location'];
  }
}