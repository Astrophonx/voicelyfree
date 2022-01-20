import 'package:clubroom/components/curved_image.dart';
import 'package:clubroom/components/follow_button.dart';
import 'package:clubroom/components/light_dark_text.dart';
import 'package:clubroom/models/speaker_data.dart';
import 'package:flutter/material.dart';
import 'package:clubroom/generated/l10n.dart';

class UserContent extends StatefulWidget {
  final Speaker speaker;
  final bool isTwoLineDescription;
  final bool isMe;

  UserContent(this.speaker,
      {this.isTwoLineDescription = true, this.isMe = false});

  @override
  _UserContentState createState() => _UserContentState();
}

class _UserContentState extends State<UserContent> {
  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CurvedImage(widget.speaker.image, height: size.width / 4),
            SizedBox(width: 20),
            LightDarkText(widget.speaker.name, "@" + widget.speaker.name),
          ],
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LightDarkText("24.9k", s.followers),
            LightDarkText("808", s.followings),
            if (widget.isMe)
              MaterialButton(onPressed: null)
            else
              FollowButton(
                isFollowing: widget.speaker.isFollowing,
                onTap: () {
                  setState(() {
                    widget.speaker.isFollowing = !widget.speaker.isFollowing;
                  });
                },
              ),
          ],
        ),
        SizedBox(height: 24),
        Text(
          widget.speaker.description,
          maxLines: widget.isTwoLineDescription ? 2 : null,
          overflow: widget.isTwoLineDescription ? TextOverflow.ellipsis : null,
        ),
      ],
    );
  }
}
