import 'package:clubroom/components/curved_image.dart';
import 'package:clubroom/models/club_data.dart';
import 'package:flutter/material.dart';

class ClubList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width / 7.6,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsetsDirectional.only(start: 30),
        itemCount: clubs.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(end: 6),
            child: CurvedImage(clubs[index].image, radius: 18),
          );
        },
      ),
    );
  }
}
