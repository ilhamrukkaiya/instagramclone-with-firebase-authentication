import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CommendModel {
  final String comdname;
  final String msg;
  final String date;
  final bool islike;
  final int likescound;
  final String image;
  CommendModel({
    required this.comdname,
    required this.msg,
    required this.date,
    required this.islike,
    required this.likescound,
    required this.image,
  });
}

List<CommendModel> comdlist = [
  CommendModel(
      comdname: "ashik",
      msg: "super",
      date: "22/3/22",
      islike: true,
      likescound: 1,
      image: "assets/images/2.jpg"),
  CommendModel(
      comdname: "ilham",
      msg: "super",
      date: "22/3/22",
      islike: true,
      likescound: 2,
      image: "assets/images/9.jpg"),
  CommendModel(
      comdname: "maryam",
      msg: "nice",
      date: "23/3/22",
      islike: false,
      likescound: 0,
      image: "assets/images/8.jpg"),
  CommendModel(
      comdname: "aashiyah",
      msg: "smilly",
      date: "22/3/22",
      islike: false,
      likescound: 0,
      image: "assets/images/7.jpg"),
  CommendModel(
      comdname: "yegiya",
      msg: "super",
      date: "22/3/22",
      islike: true,
      likescound: 2,
      image: "assets/images/3.jpg"),
  CommendModel(
      comdname: "ashik",
      msg: "super",
      date: "22/3/22",
      islike: true,
      likescound: 3,
      image: "assets/images/2.jpg"),
  CommendModel(
      comdname: "ashik",
      msg: "super",
      date: "22/3/22",
      islike: false,
      likescound: 0,
      image: "assets/images/2.jpg"),
];
