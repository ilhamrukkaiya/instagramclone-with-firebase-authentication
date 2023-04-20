// // ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:instlogin/models/postmodel.dart';
import 'package:instlogin/models/profilemodel.dart';
import 'package:instlogin/widgets/commend.dart';
import 'package:instlogin/widgets/message.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppBar Appbar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: IconButton(
        icon: const Icon(
          Icons.camera_alt_outlined,
        ),
        color: Colors.black,
        onPressed: () {},
      ),
      title: const Text(
        "Instagram",
        style: TextStyle(
            fontFamily: "billabong", fontSize: 40, color: Colors.black),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Message()));
          },
          icon: const Icon(Icons.send),
          color: Colors.black,
        )
      ],
    );
  }

  Padding toptitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Text(
            "Stories",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          const Icon(Icons.arrow_right_sharp),
          const Text(
            "Watch all",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  final double iconsize = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            toptitle(),
            poststorywidget(),
            Divider(
              thickness: 2,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: PostList.length,
              itemBuilder: (context, index) {
                return postwidget(
                  postmodel: PostList[index],
                );
              },
            )
          ],
        ),
      ),
    );
  }

  SingleChildScrollView poststorywidget() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            YourStory(),
            for (int i = 0; i < storylist.length; i++) ...{
              Storywidget(
                  name: storylist[i].name, imagepath: storylist[i].imagepath)
            }
          ],
        ),
      ),
    );
  }
}

class YourStory extends StatelessWidget {
  const YourStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            ClipOval(
              child: Image.asset(
                storylist[0].imagepath,
                height: 70,
              ),
            ),
            Positioned(
                bottom: -11,
                right: -11,
                child: IconButton(
                  icon: Material(
                      borderRadius: BorderRadius.circular(50),
                      child: Icon(
                        Icons.add_circle,
                        color: Colors.blue,
                        size: 18,
                      )),
                  onPressed: () {},
                ))
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "Your Story",
          style: TextStyle(color: Colors.black, fontSize: 15),
        )
      ],
    );
  }
}

class postwidget extends StatefulWidget {
  const postwidget({
    Key? key,
    required this.postmodel,
  }) : super(key: key);
  final PostModel postmodel;

  @override
  State<postwidget> createState() => _postwidgetState();
}

class _postwidgetState extends State<postwidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: instagradient(
                  imagepath: storylist[2].imagepath,
                  size: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(widget.postmodel.username),
              ),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(widget.postmodel.PostedImage),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    widget.postmodel.likes = !widget.postmodel.likes;
                    if (widget.postmodel.likes) {
                      widget.postmodel.Likescount += 1;
                    } else {
                      widget.postmodel.Likescount -= 1;
                    }
                  });
                },
                icon: widget.postmodel.likes
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border),
                color: widget.postmodel.likes ? Colors.red : Colors.black,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Comment()));
                  },
                  icon: Icon(Icons.circle_outlined)),
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Message()));
                  },
                  icon: Icon(Icons.send)),
              Spacer(),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.bookmark_border_outlined)),
            ],
          ),
          Text(
            " ${widget.postmodel.Likescount} Likes",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(
                widget.postmodel.content,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Text(
                "#${widget.postmodel.hasTagh[0]}",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        ]));
  }
}

class Storywidget extends StatelessWidget {
  const Storywidget({
    Key? key,
    required this.name,
    required this.imagepath,
  }) : super(key: key);
  final String name;
  final String imagepath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          instagradient(
            imagepath: imagepath,
            size: 45,
          ),
          Text(
            name,
            style: TextStyle(color: Colors.black, fontSize: 15),
          )
        ],
      ),
    );
  }
}

class instagradient extends StatelessWidget {
  const instagradient({
    Key? key,
    required this.size,
    required this.imagepath,
  }) : super(key: key);
  final double size;
  final String imagepath;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        width: 80,
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Colors.deepOrange, Colors.purple, Colors.lime]),
        ),
        child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: ClipOval(
              child: Image.asset(
                imagepath,
                height: 80,
                fit: BoxFit.cover,
              ),
            )));
  }
}
