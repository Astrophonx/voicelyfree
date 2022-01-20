import 'package:clubroom/components/curved_image.dart';
import 'package:clubroom/models/speaker_data.dart';
import 'package:flutter/material.dart';
import 'package:clubroom/generated/l10n.dart';

class ActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(s.activity.toUpperCase()),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: speakers.length,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(20),
        itemBuilder: (context, index) {
          var speaker = speakers[index];
          return Padding(
            padding: EdgeInsets.only(bottom: 24),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CurvedImage(speaker.image, radius: 20),
              title: Text(speaker.name, style: theme.textTheme.bodyText1),
              subtitle: Text(
                speaker.description,
                style: theme.textTheme.overline,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Text("3m ago", style: theme.textTheme.caption),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
