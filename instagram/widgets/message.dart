import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instlogin/pages/homepage.dart';
import 'package:instlogin/models/chatmodel.dart';
import 'package:instlogin/models/model.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "christin",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.call,
                color: Colors.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefix: Icon(Icons.search),
                      hintText: "Search"),
                ),
              ),
            ),
            Container(
              height: 140,
              color: Colors.white,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: ProfileList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        index == 0
                            ? AddMaessage()
                            : Column(children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(
                                        ProfileList[index].imagePath),
                                    radius: 50,
                                  ),
                                ),
                                Text(
                                  ProfileList[index].profileName,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                )
                              ])
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: chatlist.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Divider(
                        height: 1.0,
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(chatlist[index].pic),
                        ),
                        title: Row(
                          children: [
                            Text(
                              chatlist[index].name,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              chatlist[index].time,
                              style: TextStyle(
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                        subtitle: Text(chatlist[index].msg,
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Column AddMaessage() {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(ProfileList[0].imagePath),
              radius: 50,
            ),
            Positioned(
                top: 0,
                right: 0,
                child: Material(
                    borderRadius: BorderRadius.circular(50),
                    child: const Icon(
                      Icons.add_circle,
                      color: Colors.blue,
                      size: 25,
                    )))
          ],
        ),
        Text(
          "Leave a note",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
