import 'package:flutter/material.dart';
import 'package:clubroom/app_config/app_config.dart';
import 'package:clubroom/models/room_data.dart';
import 'package:clubroom/models/speaker_data.dart';
import 'package:clubroom/generated/l10n.dart';

class TransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var theme = Theme.of(context);
    List<Room> rooms = [
      Room(s.app_ui_design, s.basics_of_ui_design, speakers, 250, 9),
      Room(s.united_photography_camera, s.world_camera_day, speakers, 187, 12),
      Room(s.app_ui_design, s.basics_of_ui_design, speakers, 250, 6),
      Room(s.united_photography_camera, s.world_camera_day, speakers, 187, 12),
      Room(s.united_photography_camera, s.world_camera_day, speakers, 187, 12),
      Room(s.app_ui_design, s.basics_of_ui_design, speakers, 250, 9),
      Room(s.united_photography_camera, s.world_camera_day, speakers, 187, 12),
      Room(s.app_ui_design, s.basics_of_ui_design, speakers, 250, 6),
      Room(s.united_photography_camera, s.world_camera_day, speakers, 187, 12),
      Room(s.united_photography_camera, s.world_camera_day, speakers, 187, 12),
    ];
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              s.recent_transactions.toUpperCase(),
              style: theme.textTheme.caption,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: rooms.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  var room = rooms[index];
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: RichText(
                      text: TextSpan(
                        style: theme.textTheme.overline,
                        children: [
                          TextSpan(text: s.joined_on + " "),
                          TextSpan(
                            text: "20 June, 10:00 am",
                            style: theme.textTheme.overline!.copyWith(
                              color: theme.accentColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Text(
                      room.title,
                      style: theme.textTheme.subtitle1,
                    ),
                    trailing: Text(
                      "${AppConfig.currency} ${room.price.toStringAsFixed(0)}",
                      style: theme.textTheme.subtitle1!
                          .copyWith(color: Colors.red),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: theme.scaffoldBackgroundColor,
                    thickness: 3,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
