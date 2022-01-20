import 'package:clubroom/components/my_profile_button.dart';
import 'package:clubroom/components/ticket.dart';
import 'package:clubroom/components/category_row.dart';
import 'package:clubroom/features/room/components/moderator_bottom_widget.dart';
import 'package:clubroom/features/room/components/more_container.dart';
import 'package:clubroom/features/room/components/room_details_bottom_widget.dart';
import 'package:clubroom/features/room/ui/speaker_and_listener_grids.dart';
import 'package:clubroom/models/room_data.dart';
import 'package:clubroom/utils/sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'clubroom_rules_sheet.dart';

class RoomDetailsPage extends StatefulWidget {
  final Room room;
  final VoidCallback onLeaveTap;
  final bool asModerator;

  RoomDetailsPage(this.room,
      {required this.onLeaveTap, this.asModerator = false});

  @override
  _RoomDetailsPageState createState() => _RoomDetailsPageState();
}

class _RoomDetailsPageState extends State<RoomDetailsPage> {
  bool showMoreContainer = false;
  bool isRaised = false;
  bool? isMicOn;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.keyboard_arrow_down),
          iconSize: 40,
        ),
        actions: [
          Ticket(widget.room.price),
          RulesButton(),
          MyProfileButton(),
        ],
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                child: CategoryRow(widget.room.category),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  widget.room.title,
                  style: theme.textTheme.subtitle1,
                ),
              ),
              SpeakerAndListenerGrids(
                widget.room.speakers,
                isMine: isMicOn != null,
              ),
            ],
          ),
          if (showMoreContainer)
            Align(
              alignment: Alignment.bottomCenter,
              child: MoreContainer(),
            ),
          if (widget.asModerator)
            ModeratorBottomWidget(
              isMoreContainerOpened: showMoreContainer,
              onLeaveTap: widget.onLeaveTap,
              onMorePressed: _onMorePressed,
              isMicOn: isMicOn ?? false,
              onSecondaryTap: () {
                if (isMicOn == null) {
                  isMicOn = true;
                } else {
                  isMicOn = !isMicOn!;
                }
                setState(() {});
              },
            )
          else
            RoomDetailsBottomWidget(
              isMoreContainerOpened: showMoreContainer,
              onLeaveTap: widget.onLeaveTap,
              onMorePressed: _onMorePressed,
              isMicOn: isMicOn,
              isRaised: isRaised,
              onSecondaryTap: () {
                if (isMicOn == null) {
                  setState(() {
                    isRaised = !isRaised;
                  });
                  Future.delayed(Duration(seconds: 3), () {
                    setState(() {
                      isMicOn = true;
                    });
                    Navigator.pop(context);
                  });
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: theme.scaffoldBackgroundColor,
                        title: Text(
                          "Wait for 3 seconds!",
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  );
                } else {
                  setState(() {
                    isMicOn = !isMicOn!;
                  });
                }
              },
            ),
        ],
      ),
    );
  }

  void _onMorePressed() {
    setState(
      () {
        showMoreContainer = !showMoreContainer;
      },
    );
  }
}

class RulesButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Sheet.openFrosted(context, ClubRoomRulesSheet()),
      icon: Icon(Icons.assignment),
      color: Theme.of(context).disabledColor,
    );
  }
}
