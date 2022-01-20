import 'package:animations/animations.dart';
import 'package:clubroom/features/user_profile/ui/user_profile_page.dart';
import 'package:clubroom/models/speaker_data.dart';
import 'package:flutter/material.dart';

import 'curved_image.dart';

class MyProfileButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 16, top: 8, bottom: 8),
      child: OpenContainer(
        closedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        closedBuilder: (context, action) {
          return CurvedImage(speakers.first.image, radius: 18);
        },
        closedColor: theme.scaffoldBackgroundColor,
        openColor: theme.scaffoldBackgroundColor,
        openBuilder: (context, action) {
          return UserProfilePage(speakers.first, isMe: true);
        },
      ),
    );
  }
}
