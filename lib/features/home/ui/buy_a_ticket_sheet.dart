import 'package:clubroom/app_config/app_config.dart';
import 'package:clubroom/components/category_row.dart';
import 'package:clubroom/components/ticket.dart';
import 'package:clubroom/features/home/components/mentor_list.dart';
import 'package:clubroom/models/room_data.dart';
import 'package:clubroom/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:clubroom/generated/l10n.dart';

class BuyATicketSheet extends StatelessWidget {
  final Room room;
  final bool isAll;

  BuyATicketSheet(this.room, this.isAll);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                theme.scaffoldBackgroundColor,
                theme.scaffoldBackgroundColor.withOpacity(0.3),
                theme.scaffoldBackgroundColor.withOpacity(0.0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Center(
                child: Container(
                  height: 6,
                  width: 60,
                  decoration: BoxDecoration(
                    color: theme.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Text(
                  s.today + ", 6:00 pm",
                  style: theme.textTheme.bodyText2!
                      .copyWith(color: theme.primaryColor),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  physics: BouncingScrollPhysics(),
                  children: [
                    SizedBox(height: 8),
                    Text(room.title, style: theme.textTheme.subtitle1),
                    SizedBox(height: 4),
                    CategoryRow(room.category),
                    SizedBox(height: 16),
                    Text(
                      s.the_room_for_beginners,
                      style: theme.textTheme.overline!
                          .copyWith(color: theme.accentColor),
                    ),
                    SizedBox(height: 16),
                    Text(s.mentors.toUpperCase(),
                        style: theme.textTheme.caption),
                    MentorList(room.speakers),
                  ],
                ),
              ),
            ],
          ),
        ),
        PositionedDirectional(
          top: 8,
          end: 16,
          child: ButtonBar(
            children: [
              Ticket(room.price),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications),
                color: theme.disabledColor,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 40,
          left: 20,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildColumn(
                theme,
                t1: "${AppConfig.currency}${room.price}",
                t2: s.ticket_charge,
              ),
              Expanded(
                child: FloatingActionButton.extended(
                  onPressed: () => Navigator.popAndPushNamed(
                      context, PageRoutes.confirmPaymentPage),
                  label: Text(isAll ? s.buy_a_ticket : s.edit),
                  icon: Icon(isAll ? Icons.add : Icons.edit, size: 16),
                  foregroundColor: theme.accentColor,
                  backgroundColor: theme.primaryColor,
                ),
              ),
              buildColumn(
                theme,
                icon: Icons.share,
                t2: s.ticket_charge,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildColumn(
    ThemeData theme, {
    String? t1,
    required String? t2,
    IconData? icon,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (t1 != null) Text(t1, style: theme.textTheme.subtitle1),
        if (icon != null) Icon(icon, color: theme.accentColor),
        SizedBox(height: 4),
        Text(
          t2!,
          style: theme.textTheme.caption!.copyWith(color: theme.accentColor),
        ),
      ],
    );
  }
}

// ModeratorBottomWidget(
//               icon: showMoreContainer ? Icons.close : Icons.more_horiz,
//               onLeaveTap: widget.onLeaveTap,
//               onMorePressed: () {
//                 setState(() {
//                   showMoreContainer = !showMoreContainer;
//                 });
//               },
//             )
