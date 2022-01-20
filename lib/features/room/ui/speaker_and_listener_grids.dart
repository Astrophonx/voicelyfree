import 'package:clubroom/features/room/components/speakers_grid.dart';
import 'package:clubroom/generated/l10n.dart';
import 'package:clubroom/models/speaker_data.dart';
import 'package:flutter/material.dart';

class SpeakerAndListenerGrids extends StatelessWidget {
  final List<Speaker> speakers;
  final bool isMine;

  SpeakerAndListenerGrids(this.speakers, {this.isMine = false});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(bottom: 84),
          children: [
            SpeakersGrid(speakers.sublist(0, isMine ? 9 : 8), true),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 40),
              child: Text(
                S.of(context).other_listeners,
                style: theme.textTheme.caption,
              ),
            ),
            SpeakersGrid(speakers, false, crossAxisCount: 4),
          ],
        ),
      ),
    );
  }
}
