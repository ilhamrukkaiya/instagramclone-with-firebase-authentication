// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:instlogin/provider/user_provider.dart';
// import 'package:instlogin/resoures/fireStore_methods.dart';
// import 'package:instlogin/utils/utils.dart';
// import 'package:provider/provider.dart';

// import '../models/commendmodel.dart';
// import '../models/user.dart';

// class Comment extends StatefulWidget {
//   final postId;
//   const Comment({super.key, this.postId});

//   @override
//   State<Comment> createState() => _CommentState();
// }

// class _CommentState extends State<Comment> {
//   final TextEditingController commentcontroll = TextEditingController();
//   void postComment(String uid, String name, String prifileImg) async {
//     try {
//       String res = await FireStroeMethods().postComment(
//           widget.postId, commentcontroll.text, uid, name, prifileImg);
//       if (res != 'success') {
//         showSnacBar(context, res);
//       }
//       setState(() {
//         commentcontroll.text = "";
//       });
//     } catch (e) {
//       showSnacBar(context, e.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Users user = Provider.of<UserProvider>(context).getuser as Users;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Commends",
//           style: TextStyle(
//               color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
//         ),
//         backgroundColor: Colors.white,
//       ),
//       // ignore: prefer_const_constructors
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('posts')
//             .doc(widget.postId)
//             .collection('comments')
//             .snapshots(),
//         builder: (context,
//             AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           return ListView.builder(
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (context, index) {
//               return Commendcard(snap: snapshot.data!.docs[index],);
//             },
//           );
//         },
//       ),
//       bottomNavigationBar: Padding(
//         padding: MediaQuery.of(context).viewInsets,
//         child: Container(
//           height: 50,
//           color: Colors.white,
//           margin: EdgeInsets.only(bottom: 5),
//           padding: EdgeInsets.only(left: 16, right: 8),
//           child: Row(
//             children: [
//               CircleAvatar(
//                 backgroundImage: NetworkImage(user.photourl),
//                 radius: 18,
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 16, right: 8),
//                   child: TextField(
//                     controller: commentcontroll,
//                     decoration: InputDecoration(
//                         hintText: "enter your commend",
//                         border: InputBorder.none),
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {
//                   postComment(user.uid, user.username, user.photourl);
//                 },
//                 child: Container(
//                   color: Colors.blue,
//                   padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
//                   child: Text("post",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Commendcard extends StatefulWidget {
 
//   const Commendcard({super.key,required this.snap});
//    final snap;

//   @override
//   State<Commendcard> createState() => _CommendcardState();
// }

// class _CommendcardState extends State<Commendcard> {
//   @override
//   Widget build(BuildContext context) {
 
 
//     return SingleChildScrollView(
//       child: Container(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               CircleAvatar(
//                 radius: 18,
//                 backgroundImage:NetworkImage(widget.snap.data()['prifileImg']),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         widget.snap.data()['username'],
//                         style: TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                         widget.snap.data()['text'],
//                         style: TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: 4),
//                 child: Text(
//                 "22/4"),
//               ),
//               Column(
//                 children: [
//                   Container(
//                     padding: EdgeInsets.all(8),
//                     child: IconButton(
//                       onPressed: () {
//                         setState(() {
//                           widget.snap.islike = !widget.snap.islike;
//                           if (widget.snap.islike) {
//                             widget.snap.likescount += 1;
//                           } else {
//                             widget.snap.likescount -= 1;
//                           }
//                         });
//                       },
//                       icon: widget.snap.islike
//                           ? Icon(Icons.favorite)
//                           : Icon(Icons.favorite_border),
//                       color:
//                           widget.snap.islike ? Colors.red : Colors.black,
//                     ),
//                   ),
//                   Text(widget.snap.likescound.toString())
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../models/commendmodel.dart';

class Comment extends StatefulWidget {
  const Comment({super.key});

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  final TextEditingController commentcontroll = TextEditingController();
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Commends",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.send,
                color: Colors.black,
              ))
        ],
      ),
      // ignore: prefer_const_constructors
      body: ListView.builder(
        itemCount: comdlist.length,
        itemBuilder: (context, index) {
          return Commendcard(
            comtmodel: comdlist[index],
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          height: 50,
          color: Colors.white,
          margin: EdgeInsets.only(bottom: 5),
          padding: EdgeInsets.only(left: 16, right: 8),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/images/1.jpg",
                ),
                radius: 18,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  child: TextField(
                    controller: commentcontroll,
                    decoration: InputDecoration(
                        hintText: "enter your commend",
                        border: InputBorder.none),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    comdlist.add(CommendModel(
                        comdname: "ashik",
                        msg: commentcontroll.text,
                        date: DateTime.now().toString(),
                        islike: false,
                        likescound: 0,
                        image: "assets/images/2.jpg"));
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Text("post"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Commendcard extends StatefulWidget {
  final comtmodel;
  const Commendcard({super.key, this.comtmodel});

  @override
  State<Commendcard> createState() => _CommendcardState();
}

class _CommendcardState extends State<Commendcard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(
                  widget.comtmodel.image,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.comtmodel.comdname,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.comtmodel.msg,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(widget.comtmodel.date),
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.comtmodel.islike = !widget.comtmodel.islike;
                          if (widget.comtmodel.islike) {
                            widget.comtmodel.likescount += 1;
                          } else {
                            widget.comtmodel.likescount -= 1;
                          }
                        });
                      },
                      icon: widget.comtmodel.islike
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_border),
                      color:
                          widget.comtmodel.islike ? Colors.red : Colors.black,
                    ),
                  ),
                  Text(widget.comtmodel.likescound.toString())
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


