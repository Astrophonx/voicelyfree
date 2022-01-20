import 'package:clubroom/components/custom_button.dart';
import 'package:clubroom/components/custom_text_field.dart';
import 'package:clubroom/components/frosted_container.dart';
import 'package:clubroom/features/home/components/friends_list.dart';
import 'package:clubroom/features/home/components/room_type_row.dart';
import 'package:clubroom/features/room/ui/room_details_page.dart';
import 'package:clubroom/models/room_data.dart';
import 'package:clubroom/utils/selection_tracker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:clubroom/generated/l10n.dart';

class StartARoomSheet extends StatefulWidget {
  final Room room;
  final VoidCallback onLeaveTap;

  StartARoomSheet(this.room, this.onLeaveTap);

  @override
  _StartARoomSheetState createState() => _StartARoomSheetState();
}

class _StartARoomSheetState extends State<StartARoomSheet> {
  final SelectionTracker<int> _selectionTracker = SelectionTracker<int>();

  @override
  void initState() {
    super.initState();
    _selectionTracker.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _selectionTracker.clearListeners();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var theme = Theme.of(context);
    return Stack(
      children: [
        FrostedContainer(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.64,
            child: Column(
              children: [
                Text(
                  s.start_a_room.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: theme.textTheme.subtitle1,
                ),
                SizedBox(height: 48),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: RoomTypeRow(),
                ),
                SizedBox(height: 24),
                Expanded(
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      buildRichText(
                        theme,
                        s.start_a_room + " " + s.forText,
                        s.people_i_choose,
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: CustomTextField(
                          hint: s.add_a_topic,
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 84),
                        child: CustomButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RoomDetailsPage(
                                  widget.room,
                                  onLeaveTap: widget.onLeaveTap,
                                  asModerator: true,
                                ),
                              ),
                            );
                          },
                          text: S.of(context).start_now,
                        ),
                      ),
                      SizedBox(height: 30),
                      buildRichText(
                        theme,
                        s.or_start_a_private,
                        s.online_friends,
                      ),
                      FriendsList(_selectionTracker),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        ButtonBar(
          children: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
              color: theme.accentColor,
            ),
          ],
        ),
      ],
    );
  }

  RichText buildRichText(ThemeData theme, String t1, String t2) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: theme.textTheme.caption!.copyWith(fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: t1,
          ),
          TextSpan(text: " "),
          TextSpan(
            text: t2,
            style: theme.textTheme.caption!.copyWith(
                color: theme.accentColor, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
