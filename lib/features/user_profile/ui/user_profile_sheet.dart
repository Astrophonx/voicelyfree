import 'package:clubroom/components/frosted_container.dart';
import 'package:clubroom/features/user_profile/ui/user_content.dart';
import 'package:clubroom/models/speaker_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clubroom/generated/l10n.dart';
import 'package:flutter/widgets.dart';

class UserProfileSheet extends StatelessWidget {
  final Speaker speaker;
  final Function()? openPage;

  UserProfileSheet(this.speaker, this.openPage);

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var theme = Theme.of(context);
    return Stack(
      children: [
        FrostedContainer(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              UserContent(speaker),
              SizedBox(height: 24),
              MaterialButton(
                onPressed: openPage,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: theme.cardColor,
                child: Text(s.view_full_profile),
                textColor: theme.accentColor,
                padding: EdgeInsets.symmetric(vertical: 16),
              )
            ],
          ),
        ),
        ButtonBar(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
              color: theme.accentColor,
            ),
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.close),
              color: theme.accentColor,
            ),
          ],
        )
      ],
    );
  }
}
