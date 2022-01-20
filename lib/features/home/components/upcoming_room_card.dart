import 'package:clubroom/components/category_row.dart';
import 'package:clubroom/components/speaker_card.dart';
import 'package:clubroom/components/ticket.dart';
import 'package:clubroom/features/home/ui/buy_a_ticket_sheet.dart';
import 'package:clubroom/models/room_data.dart';
import 'package:clubroom/utils/sheet.dart';
import 'package:flutter/material.dart';
import 'package:clubroom/generated/l10n.dart';

class UpcomingRoomCard extends StatelessWidget {
  final Room room;
  final bool isAll;

  UpcomingRoomCard(this.room, this.isAll);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return InkWell(
      onTap: () => Sheet.open(context, BuyATicketSheet(room, isAll)),
      child: Stack(
        children: [
          Card(
            margin: EdgeInsets.fromLTRB(16, 0, 16, 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    s.today + ", 6:00 pm",
                    style: theme.textTheme.bodyText2!
                        .copyWith(color: theme.primaryColor),
                  ),
                  SizedBox(height: 8),
                  Text(
                    room.title,
                    style: theme.textTheme.subtitle1,
                  ),
                  SizedBox(height: 4),
                  CategoryRow(room.category),
                  SizedBox(height: MediaQuery.of(context).size.width / 3.6),
                  Text(
                    s.the_room_for_beginners,
                    style: theme.textTheme.overline!
                        .copyWith(color: theme.accentColor),
                  ),
                ],
              ),
            ),
          ),
          PositionedDirectional(
            end: 16,
            child: ButtonBar(
              children: [
                Ticket(room.price),
                if (isAll)
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notifications),
                    color: theme.disabledColor,
                  )
                else
                  MaterialButton(
                    onPressed: () {},
                    child: Text(s.edit),
                    textColor: theme.primaryColor,
                  ),
              ],
            ),
          ),
          speakersList(context),
        ],
      ),
    );
  }

  Widget speakersList(BuildContext context) {
    return PositionedDirectional(
      top: 108,
      start: 36,
      end: 0,
      child: SizedBox(
        height: MediaQuery.of(context).size.width / 4.5,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: room.speakers.length,
          itemBuilder: (context, index) {
            var speaker = room.speakers[index];
            return Padding(
              padding: EdgeInsetsDirectional.only(end: 8.0),
              child: SpeakerCard(
                speaker,
                height: MediaQuery.of(context).size.width / 7.2,
                radius: 18,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            );
          },
        ),
      ),
    );
  }
}
