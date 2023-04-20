// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LikePage extends StatefulWidget {
  const LikePage({super.key});

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Activity",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: ListView(children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 5.0),
          child: Text(
            "Today",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
          ),
        ),
        ActivityTileAlt(
            username: "raja",
            mention: true,
            ppict: "assets/images/1.jpg",
            image: "assets/images/2.jpg"),
        ActivityTile(ppict: "assets/images/4.jpg", username: "ashik"),
        ActivityTileAlt(
            username: "maryam",
            mention: false,
            ppict: "assets/images/8.jpg",
            image: "assets/images/9.jpg"),
        ActivityTile(ppict: "assets/images/3.jpg", username: "abdulla"),
        ActivityTileAlt(
            username: " arul",
            mention: true,
            ppict: "assets/images/2.jpg",
            image: "assets/images/1.jpg"),
        Padding(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 5.0),
          child: Text(
            "This Month",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
          ),
        ),
        ActivityTileAlt(
            username: "maryam",
            mention: false,
            ppict: "assets/images/8.jpg",
            image: "assets/images/9.jpg"),
        ActivityTile(ppict: "assets/images/3.jpg", username: "abdulla"),
        ActivityTileAlt(
            username: " arul",
            mention: true,
            ppict: "assets/images/2.jpg",
            image: "assets/images/1.jpg"),
        Padding(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 5.0),
          child: Text(
            "Suggestion for you",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
          ),
        ),
        SuggestionsTile(
            username: "aasiyah",
            fullname: "aasiyah",
            ppict: "assets/images/9.jpg"),
        SuggestionsTile(
            username: "arul",
            fullname: "arul kumar",
            ppict: "assets/images/3.jpg")
      ]),
    );
  }
}

class ActivityTileAlt extends StatelessWidget {
  final String username;
  final bool mention;
  final String ppict;
  final String image;
  const ActivityTileAlt(
      {super.key,
      required this.username,
      required this.mention,
      required this.ppict,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage(ppict),
              ),
              SizedBox(
                width: 10.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.8,
                child: Text.rich(
                  TextSpan(
                    text: username,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: mention
                              ? '  mentioned you in a comment'
                              : '  liked your post',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.normal))
                    ],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Container(
            width: 50.0,
            height: 50.0,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          )
        ]));
  }
}

class ActivityTile extends StatelessWidget {
  final String ppict;
  final String username;

  const ActivityTile({super.key, required this.ppict, required this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 13.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage(ppict),
            ),
            SizedBox(
              width: 10.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.8,
              child: Text.rich(
                TextSpan(
                  text: username,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: "  started following you",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.normal))
                  ],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ));
  }
}

class SuggestionsTile extends StatelessWidget {
  final String username;
  final String fullname;
  final String ppict;
  const SuggestionsTile(
      {super.key,
      required this.username,
      required this.fullname,
      required this.ppict});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 13.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage(ppict),
            ),
            SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(username),
                SizedBox(
                  height: 5,
                ),
                Text(fullname),
              ],
            ),
          ]),
          Row(
            children: [
              Center(
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Follow",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0),
                      ))),
              SizedBox(
                width: 10.0,
              ),
              Icon(
                Icons.close,
                size: 15.0,
              )
            ],
          )
        ],
      ),
    );
  }
}
