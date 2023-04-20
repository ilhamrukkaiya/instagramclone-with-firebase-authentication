import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

import 'package:instlogin/models/postmodel.dart';
import 'package:instlogin/models/reelmodel.dart';
import 'package:video_player/video_player.dart';

class ReelsPage extends StatefulWidget {
  const ReelsPage({super.key});

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  bool isplay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          "Reels",
          style: TextStyle(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.photo_camera_outlined),
            color: Colors.white,
          )
        ],
      ),
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: instareel.length,
          itemBuilder: (context, index) {
            VideoPlayerController video =
                VideoPlayerController.network(instareel[index].video);

            return Container(
              child: Center(
                  child: Stack(
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          isplay = !isplay;
                          if (isplay) {
                            video.play();
                          } else {
                            video.pause();
                          }
                        });
                      },
                      child: VideoPlayer(video)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Flexible(
                              flex: 14,
                              child: ReelDetails(
                                reels: instareel[index],
                              )),
                          Flexible(
                              flex: 2,
                              child: ReelSideActionBar(
                                reels: instareel[index],
                              )),
                        ],
                      )
                    ],
                  )
                ],
              )),
            );
          }),
    );
  }
}

class ReelSideActionBar extends StatelessWidget {
  const ReelSideActionBar({
    Key? key,
    required this.reels,
  }) : super(key: key);
  final Reel reels;

  final double _iconsize = 28;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {},
              icon:
                  Icon(reels.isLiked ? Icons.favorite : Icons.favorite_outline),
              iconSize: _iconsize,
              color: reels.isLiked ? Colors.red : Colors.white,
            ),
            Text(
              reels.PostedBy,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.chat_bubble_outline),
              iconSize: _iconsize,
              color: Colors.white,
            ),
            Text(reels.totalcomment,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            SizedBox(
              height: 10,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.send_outlined),
              iconSize: _iconsize,
              color: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_horiz),
              iconSize: _iconsize,
              color: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: AssetImage("assets/images/9.jpg")))),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ],
    );
  }
}

class ReelDetails extends StatelessWidget {
  const ReelDetails({
    Key? key,
    required this.reels,
  }) : super(key: key);
  final Reel reels;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            dense: true,
            minLeadingWidth: 0,
            title: Text(
              "${reels.PostedBy} - Follow ",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            leading: CircleAvatar(
              radius: 14,
              backgroundImage: AssetImage("assets/images/1.jpg"),
            ),
          ),
          ExpandableText(
            "This example shows a message that was posted by a user. The username is always visible right before the text and tapping on it opens the user profile. The text is truncated after two lines and can be expanded by tapping on the link show more at the end or the text itself. After the text was expanded it cannot be collapsed again as no collapseText was provided. URLs, @mentions and #hashtags in the text are styled differently and can be tapped to open the browser or the user profile.",
            style: TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.bold,
                color: Colors.white),
            expandText: "more",
            collapseText: "less",
            expandOnTextTap: true,
            collapseOnTextTap: true,
            maxLines: 1,
            linkColor: Colors.grey,
          ),
          ListTile(
              dense: true,
              minLeadingWidth: 0,
              title: Text(
                reels.audioTitle,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              leading: Icon(
                Icons.graphic_eq_outlined,
                size: 16,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
