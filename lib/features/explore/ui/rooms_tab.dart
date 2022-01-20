import 'package:clubroom/components/curved_image.dart';
import 'package:clubroom/components/small_icon.dart';
import 'package:clubroom/models/club_data.dart';
import 'package:flutter/material.dart';
import 'package:clubroom/generated/l10n.dart';

class RoomsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return ListView.builder(
      itemCount: clubs.length,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(top: 30),
      itemBuilder: (context, index) {
        var club = clubs[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 20.0),
          child: ListTile(
            leading: CurvedImage(club.image, radius: 20),
            title: Row(
              children: [
                Text(club.name, style: theme.textTheme.bodyText2),
                SizedBox(width: 8),
                SmallIcon(Icons.flag, color: theme.primaryColor),
              ],
            ),
            subtitle: Row(
              children: [
                Text(
                  "${club.numberOfMembers} ${s.members}",
                  style: theme.textTheme.caption,
                ),
                SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: theme.primaryColor,
                  radius: 2,
                ),
                SizedBox(width: 8),
                Text(
                  "${club.formattedFollowers} ${s.followers}",
                  style: theme.textTheme.caption,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
