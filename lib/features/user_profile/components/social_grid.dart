import 'package:clubroom/assets/assets.dart';
import 'package:clubroom/models/speaker_data.dart';
import 'package:flutter/material.dart';

class SocialGrid extends StatelessWidget {
  final Speaker speaker;

  SocialGrid(this.speaker);

  final List<String> socialLinks = [
    Assets.twitter,
    Assets.youtube,
    Assets.instagram,
    Assets.linkedIn,
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4,
      ),
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 30),
      shrinkWrap: true,
      itemCount: socialLinks.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.asset(socialLinks[index]),
          title: Text(
            speaker.name.toLowerCase(),
            style:
                theme.textTheme.bodyText2!.copyWith(color: theme.dividerColor),
          ),
          dense: true,
          horizontalTitleGap: 0.0,
          contentPadding: EdgeInsets.zero,
        );
      },
    );
  }
}
