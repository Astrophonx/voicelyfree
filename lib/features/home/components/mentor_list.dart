import 'package:clubroom/components/curved_image.dart';
import 'package:clubroom/components/follow_button.dart';
import 'package:clubroom/models/speaker_data.dart';
import 'package:flutter/material.dart';

class MentorList extends StatefulWidget {
  final List<Speaker> speakers;
  final ScrollPhysics? physics;
  final bool? shrinkWrap;

  MentorList(this.speakers, {this.physics, this.shrinkWrap});

  @override
  _MentorListState createState() => _MentorListState();
}

class _MentorListState extends State<MentorList> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListView.builder(
      itemCount: widget.speakers.length,
      physics: widget.physics ?? NeverScrollableScrollPhysics(),
      shrinkWrap: widget.shrinkWrap ?? true,
      itemBuilder: (context, index) {
        var speaker = widget.speakers[index];
        return ListTile(
          contentPadding: EdgeInsets.only(top: 16),
          leading: CurvedImage(speaker.image, radius: 18),
          title: Text(speaker.name, style: theme.textTheme.bodyText1),
          subtitle: Text(
            speaker.description,
            style: theme.textTheme.caption,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: FollowButton(
            isFollowing: speaker.isFollowing,
            onTap: () {
              setState(() {
                speaker.isFollowing = !speaker.isFollowing;
              });
            },
          ),
        );
      },
    );
  }
}
