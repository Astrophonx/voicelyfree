import 'package:clubroom/components/small_icon.dart';
import 'package:clubroom/components/ticket.dart';
import 'package:clubroom/components/stacked_images.dart';
import 'package:clubroom/models/room_data.dart';
import 'package:clubroom/models/speaker_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../components/category_row.dart';

class RoomCard extends StatelessWidget {
  final Room room;
  final int index;

  RoomCard(this.room, this.index);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var speakers = room.speakers.sublist(index, index + 4);
    return Stack(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CategoryRow(room.category),
                Text(
                  room.title,
                  style: theme.textTheme.subtitle1,
                ),
                SizedBox(height: 16),
                StackedImages(speakers.map((e) => e.image).toList()),
                SizedBox(height: 16),
                countRow(theme)
              ],
            ),
          ),
        ),
        PositionedDirectional(
          top: 72,
          start: 156,
          width: 200,
          child: SpeakersNameList(speakers),
        ),
        if (index.isEven)
          PositionedDirectional(
            end: 0,
            child: Ticket(room.price),
          ),
      ],
    );
  }

  Row countRow(ThemeData theme) {
    return Row(
      children: [
        SmallIcon(Icons.hearing),
        SizedBox(width: 4),
        Text(
          room.audience.toString(),
          style: theme.textTheme.overline,
        ),
        SizedBox(width: 8),
        CircleAvatar(
          backgroundColor: theme.primaryColor,
          radius: 2,
        ),
        SizedBox(width: 8),
        SmallIcon(Icons.account_circle),
        SizedBox(width: 4),
        Text(
          room.speakers.length.toString(),
          style: theme.textTheme.overline,
        ),
      ],
    );
  }
}

class SpeakersNameList extends StatelessWidget {
  final List<Speaker> speakers;

  SpeakersNameList(this.speakers);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListView.builder(
      itemCount: speakers.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var speaker = speakers[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 4),
          child: Row(
            children: [
              Text(
                speaker.name,
                style: theme.textTheme.caption!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 4),
              if (index.isEven) SmallIcon(Icons.mic),
            ],
          ),
        );
      },
    );
  }
}
