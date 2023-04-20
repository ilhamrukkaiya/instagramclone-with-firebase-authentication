// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Reel {
  final String PostedBy;
  final String video;
  final String audioTitle;
  final String caption;
  final String totalLikes;
  final String totalcomment;
  final bool isLiked;
  final bool isTagged;
  final String taggedUser;
  Reel({
    required this.PostedBy,
    required this.video,
    required this.audioTitle,
    required this.caption,
    required this.totalLikes,
    required this.totalcomment,
    required this.isLiked,
    required this.isTagged,
    required this.taggedUser,
  });
}

final List<Reel> instareel = [
  Reel(
      PostedBy: "ilham",
      video:
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
      audioTitle: " audioTitle",
      caption: " caption",
      totalLikes: "1.2k",
      totalcomment: "33",
      isLiked: true,
      isTagged: true,
      taggedUser: "demo"),
  Reel(
      PostedBy: "ashik",
      video:
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
      audioTitle: " audioTitle",
      caption: " caption",
      totalLikes: "1.2k",
      totalcomment: "33",
      isLiked: true,
      isTagged: true,
      taggedUser: "demo"),
  Reel(
      PostedBy: "aashiyah",
      video:
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
      audioTitle: " audioTitle",
      caption: " caption",
      totalLikes: "1.2k",
      totalcomment: "33",
      isLiked: true,
      isTagged: true,
      taggedUser: "demo"),
  Reel(
      PostedBy: "maryam",
      video:
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
      audioTitle: " audioTitle",
      caption: " caption",
      totalLikes: "1.2k",
      totalcomment: "33",
      isLiked: true,
      isTagged: true,
      taggedUser: "demo"),
  Reel(
      PostedBy: "nasi",
      video:
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
      audioTitle: " audioTitle",
      caption: " caption",
      totalLikes: "1.2k",
      totalcomment: "33",
      isLiked: true,
      isTagged: true,
      taggedUser: "demo"),
  Reel(
      PostedBy: "junitha",
      video:
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
      audioTitle: " audioTitle",
      caption: " caption",
      totalLikes: "1.2k",
      totalcomment: "33",
      isLiked: true,
      isTagged: true,
      taggedUser: "demo"),
  Reel(
      PostedBy: "ilham",
      video:
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
      audioTitle: " audioTitle",
      caption: " caption",
      totalLikes: "1.2k",
      totalcomment: "33",
      isLiked: true,
      isTagged: true,
      taggedUser: "demo"),
];
