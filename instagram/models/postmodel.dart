// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  // String uid;
  // String postId;
  String PrifileImg;
  String username;
  String PostedImage;
  bool likes;
  List hasTagh;
  String content;
  int Likescount;
  int commentscount;
  bool Bookmark;
  // DateTime datePublished;
  PostModel({
    // ignore: non_constant_identifier_names
    // required this.uid,
    // required this.postId,
    required this.PrifileImg,
    required this.username,
    required this.PostedImage,
    required this.likes,
    required this.hasTagh,
    required this.content,
    required this.Likescount,
    required this.commentscount,
    required this.Bookmark,
    // required this.datePublished
  });
  // static PostModel fromSnap(DocumentSnapshot snap) {
  //   var snapshot = snap.data() as Map<String, dynamic>;

  //   return PostModel(
  //       uid: snapshot['uid'],
  //       postId: snapshot['postId'],
  //       PrifileImg: snapshot['prifileImg'],
  //       username: snapshot['username'],
  //       PostedImage: snapshot["PostedImage"],
  //       likes: snapshot["likes"],
  //       hasTagh: snapshot['hasTagh'],
  //       content: snapshot['content'],
  //       Likescount: snapshot['Likescount'],
  //       commentscount: snapshot['commentscount'],
  //       Bookmark: snapshot[' Bookmark'],
  //       datePublished:snapshot['datePublished']);
  // }

  // Map<String, dynamic> toJson() => {
  //       "uid": uid,
  //       "postId": postId,
  //       "prifileImg": PrifileImg,
  //       "username": username,
  //       " PostedImage": PostedImage,
  //       "likes": likes,
  //       "hasTagh": hasTagh,
  //       "content": content,
  //       "Likescount": Likescount,
  //       "commentcount": commentscount,
  //       "bookmark": Bookmark,
  //       "datePublished":datePublished
  //     };

  // @override
  // String toString() {
  //   return 'PostModel(uid: $uid, username: $username, PostedImage: $PostedImage, likes: $likes, hasTagh: $hasTagh, content: $content, Likescount: $Likescount, commentscount: $commentscount, Bookmark: $Bookmark,datePublished:$datePublished)';
  // }
}

List<PostModel> PostList = [
  PostModel(
    username: "ilham",
    PostedImage:
        "https://thumbs.dreamstime.com/b/beautiful-rain-forest-ang-ka-nature-trail-doi-inthanon-national-park-thailand-36703721.jpg",
    likes: true,
    hasTagh: [#dgudug],
    content: "nature",
    Likescount: 111,
    commentscount: 76,
    Bookmark: true, PrifileImg: 'assets/images/1.jpg',
  ),
  PostModel(
      username: "ashik",
      PostedImage:
          "https://plus.unsplash.com/premium_photo-1669532597235-dce50c7738fd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      likes: false,
      hasTagh: [#dgudug],
      content: "nature",
      Likescount: 45,
      commentscount: 76,
      Bookmark: false, PrifileImg: 'assets/images/2.jpg'),
  PostModel(
    username: "maryam",
      PostedImage:
          "https://images.unsplash.com/photo-1543002588-bfa74002ed7e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      likes: false,
      hasTagh: [#dgudug],
      content: "nature",
      Likescount: 45,
      commentscount: 76,
      Bookmark: false, PrifileImg: 'assets/images/3.jpg'),
  PostModel(
      username: "aasiyah",
      PostedImage:
          "https://cdn.pixabay.com/photo/2018/01/12/10/19/fantasy-3077928__340.jpg",
      likes: false,
      hasTagh: [#dgudug],
      content: "nature",
      Likescount: 111,
      commentscount: 76,
      Bookmark: false, PrifileImg: 'assets/images/4.jpg'),
];
