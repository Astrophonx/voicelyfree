import 'package:clubroom/assets/assets.dart';
import 'package:clubroom/components/frosted_container.dart';
import 'package:clubroom/features/room/components/more_button.dart';
import 'package:clubroom/features/room/ui/invite_to_room_sheet.dart';
import 'package:clubroom/generated/l10n.dart';
import 'package:clubroom/utils/sheet.dart';
import 'package:flutter/material.dart';

import '../../../components/emoji_button.dart';

class ModeratorBottomWidget extends StatelessWidget {
  final VoidCallback? onMorePressed;
  final VoidCallback onLeaveTap;
  final bool isMoreContainerOpened;
  final bool isMicOn;
  final VoidCallback? onSecondaryTap;

  ModeratorBottomWidget({
    this.onMorePressed,
    required this.onLeaveTap,
    this.isMoreContainerOpened = false,
    this.isMicOn = false,
    this.onSecondaryTap,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: FrostedContainer(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            EmojiButton(
              color: theme.dividerColor,
              image: Assets.leave,
              text: S.of(context).leave,
              width: 112,
              onTap: onLeaveTap,
            ),
            MoreButton(onMorePressed, isMoreContainerOpened),
            Stack(
              clipBehavior: Clip.none,
              children: [
                EmojiButton(
                  color: theme.dividerColor,
                  image: Assets.handRaise,
                  onTap: () => Sheet.openFrosted(context, InviteToRoomSheet()),
                ),
                PositionedDirectional(
                  bottom: -4,
                  end: -4,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Text('5', style: theme.textTheme.bodyText2),
                  ),
                )
              ],
            ),
            SizedBox(width: 8),
            Expanded(
              child: EmojiButton(
                color: isMicOn ? theme.primaryColor : theme.dividerColor,
                image: isMicOn ? Assets.micOn : Assets.micOff,
                text: isMicOn ? S.of(context).mic_on : S.of(context).mic_off,
                width: 120,
                onTap: onSecondaryTap,
              ),
            )
          ],
        ),
      ),
    );
  }
}
