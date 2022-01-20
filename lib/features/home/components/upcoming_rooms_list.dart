import 'package:clubroom/features/home/ui/home_page.dart';
import 'package:clubroom/models/room_data.dart';
import 'package:clubroom/models/speaker_data.dart';
import 'package:flutter/material.dart';
import 'package:clubroom/generated/l10n.dart';

import 'upcoming_room_card.dart';

class UpcomingRoomsList extends StatefulWidget {
  final bool isAll;

  UpcomingRoomsList(this.isAll);

  @override
  _UpcomingRoomsListState createState() => _UpcomingRoomsListState();
}

class _UpcomingRoomsListState extends State<UpcomingRoomsList> {
  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    List<Room> rooms = [
      Room(s.app_ui_design, s.basics_of_ui_design, speakers, 250, 9),
      Room(s.united_photography_camera, s.world_camera_day, speakers, 187, 12),
      Room(s.app_ui_design, s.basics_of_ui_design, speakers, 250, 6),
      Room(s.united_photography_camera, s.world_camera_day, speakers, 187, 12),
      Room(s.united_photography_camera, s.world_camera_day, speakers, 187, 12),
    ];
    return Expanded(
      child: ListView.builder(
        itemCount: widget.isAll ? rooms.length : 2,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 100),
        itemBuilder: (context, index) {
          return UpcomingRoomCard(rooms[index], widget.isAll);
        },
      ),
    );
  }

  void onLeaveTap() {
    setState(() {
      isInRoom = false;
    });
  }
}
