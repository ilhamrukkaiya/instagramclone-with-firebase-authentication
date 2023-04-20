// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:collection/collection.dart';
// import 'package:instlogin/pages/userpage.dart';

// class SearchPage extends StatefulWidget {
//   const SearchPage({super.key});

//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   final TextEditingController searchConroller = TextEditingController();
//   bool isShowUser = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           iconTheme: IconThemeData(color: Colors.black),
//           elevation: 0,
//           backgroundColor: Colors.white,
//           title: Container(
//             width: double.infinity,
//             decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.grey,
//                   width: 2,
//                 ),
//                 borderRadius: BorderRadius.all(Radius.circular(20))),
//             child: TextField(
//               controller: searchConroller,
//               onSubmitted: (String _) {
//                 setState(() {
//                   isShowUser = true;
//                 });
//                 print(_);
//               },
//               decoration: InputDecoration(
//                   hintText: "Search",
//                   border: InputBorder.none,
//                   prefixIcon: Icon(Icons.search)),
//             ),
//           ),
//           actions: [
//             Container(
//               margin: EdgeInsets.only(right: 20, left: 20),
//               child: Icon(Icons.camera_alt),
//             )
//           ],
//         ),
//         body: isShowUser
//             ? FutureBuilder(
//                 future: FirebaseFirestore.instance
//                     .collection('users')
//                     .where('username',
//                         isGreaterThanOrEqualTo: searchConroller.text)
//                     .get(),
//                 builder: ((context, snapshot) {
//                   if (!snapshot.hasData) {
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                   return ListView.builder(
//                     itemCount: (snapshot.data! as dynamic).docs.length,
//                     itemBuilder: (context, index) {
//                       return InkWell(
//                         onTap: () => Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => UserPage(
//                                 // uid: (snapshot.data! as dynamic).docs[index]
//                                 //     ['uid']
//                                 ))),
//                         child: ListTile(
//                             leading: CircleAvatar(
//                               backgroundColor: Colors.grey,
//                               backgroundImage: NetworkImage(
//                                   (snapshot.data! as dynamic).docs[index]
//                                       ['photourl']),
//                               radius: 16,
//                             ),
//                             title: Text(
//                               (snapshot.data! as dynamic).docs[index]
//                                   ['username'],
//                             )),
//                       );
//                     },
//                   );
//                 }))
//             : FutureBuilder(
//                 future: FirebaseFirestore.instance.collection('posts').get(),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                   return StaggeredGrid.count(
//                     crossAxisCount: 3,
//                     mainAxisSpacing: 4,
//                     crossAxisSpacing: 4,
//                     children: List.generate(
//                         (snapshot.data! as dynamic).docs.length, (index) {
//                       var height = (Random().nextInt(2) + 1);
//                       var width = (Random().nextInt(2) + 1);
//                       return StaggeredGridTile.count(
//                           crossAxisCellCount: width,
//                           mainAxisCellCount: height,
//                           child: Image.network(
//                             (snapshot.data! as dynamic).docs[index]
//                                 ['PostedImage'],
//                             fit: BoxFit.cover,
//                             height: height * 100,
//                             width: width * 100,
//                           ));
//                     }),
//                   );
//                 },
//               ));
//   }
// }
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:collection/collection.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List Picture = [
    "assets/images/11.jpg",
    "assets/images/12.jpg",
    "assets/images/13.jpg",
    "assets/images/14.jpg",
    "assets/images/16.jpg",
    "assets/images/17.jpg",
    "assets/images/1.jpg",
    "assets/images/4.jpg",
    "assets/images/16.jpg",
    "assets/images/15.jpg",
    "assets/images/10.jpg",
    "assets/images/14.jpg",
    "assets/images/11.jpg",
    "assets/images/12.jpg",
    "assets/images/8.jpg",
    "assets/images/9.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Search",
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search)),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20, left: 20),
            child: Icon(Icons.camera_alt),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: List.generate(Picture.length, (index) {
              var height = (Random().nextInt(2) + 1);
              var width = (Random().nextInt(2) + 1);
              return StaggeredGridTile.count(
                  crossAxisCellCount: width,
                  mainAxisCellCount: height,
                  child: Image.asset(
                    Picture[index],
                    fit: BoxFit.cover,
                    height: height * 100,
                    width: width * 100,
                  ));
            }),
          ),
        ),
      ),
    );
  }
}
