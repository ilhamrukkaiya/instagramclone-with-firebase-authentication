// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:instlogin/Screen/login_screen.dart';
// import 'package:instlogin/models/tags.dart';
// import 'package:instlogin/resoures/auth_method.dart';
// import 'package:instlogin/resoures/fireStore_methods.dart';
// import 'package:instlogin/utils/utils.dart';
// import 'package:sliver_tools/sliver_tools.dart';

// import '../widgets/tags.dart';
// import '../widgets/upload.dart';

// class UserPage extends StatefulWidget {
//   final String uid;
//   const UserPage({super.key, required this.uid});

//   @override
//   State<UserPage> createState() => _UserPageState();
// }

// class _UserPageState extends State<UserPage> {
//   var userData = {};
//   int postLen = 0;
//   int follower = 0;
//   int following = 0;
//   bool isfollowing = false;
//   bool isloading = false;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getData();
//   }

//   getData() async {
//     setState(() {
//       isloading = true;
//     });
//     try {
//       var userSnap = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(widget.uid)
//           .get();
//       //get post length
//       var postSnap = await FirebaseFirestore.instance
//           .collection('posts')
//           .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//           .get();
//       postLen = postSnap.docs.length;
//       userData = userSnap.data()!;
//       follower = userSnap.data()!['followers'].length;
//       following = userSnap.data()!['following'].length;
//       isfollowing = userSnap
//           .data()!['followes']
//           .contains(FirebaseAuth.instance.currentUser!.uid);
//       setState(() {});
//     } catch (e) {
//       showSnacBar(context, e.toString());
//     }
//     setState(() {
//       isloading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return isloading
//         ? Center(
//             child: CircularProgressIndicator(),
//           )
//         : Scaffold(
//             appBar: AppBar(
//               backgroundColor: Colors.white,
//               title: Text(//userData['username']
//               "ilham"),
//               centerTitle: false,
//             ),
//             body: ListView(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.all(16),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           CircleAvatar(
//                             backgroundColor: Colors.grey,
//                             backgroundImage: NetworkImage(//userData['photourl']
//                             ""),
//                             radius: 40,
//                           ),
//                           Expanded(
//                               flex: 1,
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     mainAxisSize: MainAxisSize.max,
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       buildStateColumn(postLen, 'posts'),
//                                       buildStateColumn(follower, 'followers'),
//                                       buildStateColumn(following, 'following')
//                                     ],
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       FirebaseAuth.instance.currentUser!.uid ==
//                                               widget.uid
//                                           ? TextButton(
//                                               style: TextButton.styleFrom(
//                                                   backgroundColor: Colors.blue),
//                                               onPressed: () async {
//                                                 await AuthMethod().signout();
//                                                 Navigator.pushReplacement(
//                                                     context,
//                                                     MaterialPageRoute(
//                                                         builder: (context) =>
//                                                             const LoginScreen()));
//                                               },
//                                               child: Text(
//                                                 'LogOut',
//                                                 style: TextStyle(
//                                                     color: Colors.white),
//                                               ))
//                                           : isfollowing
//                                               ? TextButton(
//                                                   style: TextButton.styleFrom(
//                                                       backgroundColor:
//                                                           Colors.blue),
//                                                   onPressed: () async {
//                                                     await FireStroeMethods()
//                                                         .followUser(
//                                                             FirebaseAuth
//                                                                 .instance
//                                                                 .currentUser!
//                                                                 .uid,
//                                                             userData['uid']);
//                                                     setState(() {
//                                                       isfollowing = false;
//                                                       follower--;
//                                                     });
//                                                   },
//                                                   child: Text(
//                                                     'Unfollow',
//                                                     style: TextStyle(
//                                                         color: Colors.white),
//                                                   ))
//                                               : TextButton(
//                                                   style: TextButton.styleFrom(
//                                                       backgroundColor:
//                                                           Colors.blue),
//                                                   onPressed: () async {
//                                                     await FireStroeMethods()
//                                                         .followUser(
//                                                             FirebaseAuth
//                                                                 .instance
//                                                                 .currentUser!
//                                                                 .uid,
//                                                             userData['uid']);
//                                                     setState(() {
//                                                       isfollowing = true;
//                                                       follower++;
//                                                     });
//                                                   },
//                                                   child: Text(
//                                                     'followUser',
//                                                     style: TextStyle(
//                                                         color: Colors.white),
//                                                   ))
//                                     ],
//                                   )
//                                 ],
//                               ))
//                         ],
//                       ),
//                       Container(
//                         alignment: Alignment.centerLeft,
//                         padding: EdgeInsets.only(top: 15),
//                         child: Text(
//                           userData['username'],
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       Container(
//                         alignment: Alignment.centerLeft,
//                         padding: EdgeInsets.only(top: 15),
//                         child: Text(
//                           userData['bio'],
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Divider(),
//                 FutureBuilder(
//                     future: FirebaseFirestore.instance
//                         .collection('posts')
//                         .where('uid', isEqualTo: widget.uid)
//                         .get(),
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       }
//                       return GridView.builder(
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 3,
//                             crossAxisSpacing: 5,
//                             childAspectRatio: 1),
//                         itemBuilder: (context, index) {
//                           DocumentSnapshot snap =
//                               (snapshot.data! as dynamic).docs[index];
//                           return Container(
//                             child: Image(image: NetworkImage(snap['PostedImage'])),
//                           );
//                         },
//                       );
//                     })
//               ],
//             ),
//           );
//   }

//   Column buildStateColumn(
//     int num,
//     String label,
//   ) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           num.toString(),
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         Container(
//           margin: EdgeInsets.only(top: 4),
//           child: Text(
//             label,
//             style: TextStyle(
//                 fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey),
//           ),
//         )
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instlogin/models/tags.dart';
import 'package:instlogin/widgets/drawer.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../widgets/tags.dart';
import '../widgets/upload.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Instagram",
              style: TextStyle(
                  fontFamily: "Billabong", fontSize: 35.0, color: Colors.black),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Material(
                      color: Colors.black,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Drawered()));
                    },
                    icon: Icon(
                      Icons.menu,
                      color: Colors.black,
                    )),
              ],
            )
          ],
        ),
      ),
      body: CustomScrollView(
        physics: ScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 0, 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/1.jpg"),
                    radius: 50,
                  ),
                  getstartCard('27', 'Postes'),
                  getstartCard('34', 'followers'),
                  getstartCard('123', 'following')
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text(
                "christin",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text(
                "i create app and game",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text(
                "youtube.com/christin",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    height: 35,
                    width: 90,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white54, width: 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    height: 35,
                    width: 90,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white54, width: 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          size: 20,
                        )),
                  ),
                ),
              ],
            ),
          ),
          GetTabar()
        ],
      ),
    );
  }

  Container getstartCard(String num, String text) {
    return Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            num,
            style: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            text,
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class GetTabar extends StatefulWidget {
  const GetTabar({super.key});

  @override
  State<GetTabar> createState() => _GetTabarState();
}

class _GetTabarState extends State<GetTabar> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return MultiSliver(children: [
      SliverPinnedHeader(
          child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Expanded(
                child: InkWell(
              onTap: () {
                setState(() {
                  index = 0;
                });
              },
              child: Center(
                child: Icon(
                  Icons.apps_outlined,
                  color: Colors.black,
                ),
              ),
            )),
            Expanded(
                child: InkWell(
              onTap: () {
                setState(() {
                  index = 1;
                });
              },
              child: Center(
                child: Icon(
                  Icons.account_box_outlined,
                  color: Colors.black,
                ),
              ),
            )),
          ],
        ),
      )),
      index == 0 ? Upload() : Tags(),
    ]);
  }
}
