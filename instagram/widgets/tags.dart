import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:instlogin/widgets/tags.dart';

import 'tags.dart';

class Tags extends StatelessWidget {
  const Tags({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List tagsimage = [
      "assets/images/1.jpg",
      "assets/images/12.jpg",
      "assets/images/13.jpg",
      "assets/images/14.jpg",
      "assets/images/6.jpg",
      "assets/images/7.jpg"
    ];
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                image: DecorationImage(image: AssetImage(tagsimage[index]))),
          );
        },
        childCount: 5,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 1),
    );
  }
}
