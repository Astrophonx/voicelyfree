import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:clubroom/components/frosted_container.dart';
import 'package:clubroom/features/room/components/text_tile.dart';
import 'package:clubroom/features/room/ui/clubroom_rules_sheet.dart';
import 'package:clubroom/features/room/ui/invite_to_room_sheet.dart';
import 'package:clubroom/generated/l10n.dart';
import 'package:clubroom/utils/sheet.dart';
import 'package:flutter/material.dart';

class MoreContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 100),
      child: FadedScaleAnimation(
        child: FrostedContainer(
          borderRadius: BorderRadius.circular(20),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextTile(
                s.invite_to_room,
                onTap: () => Sheet.openFrosted(context, InviteToRoomSheet()),
              ),
              SizedBox(height: 16),
              TextTile(
                s.search_in_room,
                onTap: () {},
              ),
              SizedBox(height: 16),
              TextTile(
                s.report_room_activity,
                onTap: () {},
              ),
              SizedBox(height: 16),
              TextTile(
                s.review_clubroom_rules,
                onTap: () => Sheet.openFrosted(context, ClubRoomRulesSheet()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
