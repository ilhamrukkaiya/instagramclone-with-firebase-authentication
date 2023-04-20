import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instlogin/pages/add_post.dart';
import 'package:instlogin/pages/homepage.dart';
import 'package:instlogin/pages/likepage.dart';
import 'package:instlogin/pages/reelpage.dart';
import 'package:instlogin/pages/searchpage.dart';
import 'package:instlogin/pages/userpage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedindex = 0;
  static List pages = [
    const HomePage(),
    const SearchPage(),
    const LikePage(),
    const ReelsPage(),
    // UserPage(uid: FirebaseAuth.instance.currentUser!.uid,)
    const UserPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedindex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        child: BottomNavigationBar(
          currentIndex: _selectedindex,
          onTap: (index) {
            setState(() {
              _selectedindex = index;
            });
          },
          type: BottomNavigationBarType.shifting,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30.0,
                  color: Colors.black,
                ),
                label: ""),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 30.0,
                  color: Colors.black,
                ),
                label: ""),
            const BottomNavigationBarItem(
                icon:Icon(
                  Icons.favorite,
                  size: 30.0,
                  color: Colors.black,
                ),
                label: ""),
            const BottomNavigationBarItem(
                icon:Icon(
                  Icons.movie_rounded,
                  size: 30.0,
                  color: Colors.black,
                ),
                label: ""),
            const BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundImage: AssetImage("assets/images/1.jpg"),
                radius: 15.0,
              ),
              label: "",
            )
          ],
        ),
      ),
    );
  }
}
