import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  List uploadimage = [
    "assets/images/1.jpg",
    "assets/images/2.jpg",
    "assets/images/3.jpg",
    "assets/images/4.jpg",
    "assets/images/9.jpg",
    "assets/images/10.jpg",
    "assets/images/5.jpg",
    "assets/images/17.jpg",
    "assets/images/18.jpg",
    "assets/images/1.jpg",
    "assets/images/1.jpg",
    "assets/images/1.jpg",
    "assets/images/1.jpg",
    "assets/images/1.jpg",
    "assets/images/1.jpg",
    "assets/images/1.jpg",
    "assets/images/1.jpg",
    "assets/images/1.jpg",
    "assets/images/1.jpg",
    "assets/images/1.jpg",
    "assets/images/1.jpg",
    "assets/images/1.jpg",
    "assets/images/1.jpg",
    "assets/images/1.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              image: DecorationImage(
                  image: AssetImage(uploadimage[index]), fit: BoxFit.cover),
            ),
          ),
        );
      }, childCount: uploadimage.length),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 1),
    );
  }
}
