import 'package:clubroom/assets/assets.dart';
import 'package:clubroom/components/frosted_container.dart';
import 'package:clubroom/features/room/components/more_button.dart';
import 'package:clubroom/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../../components/emoji_button.dart';

class RoomDetailsBottomWidget extends StatelessWidget {
  final VoidCallback? onMorePressed;
  final VoidCallback? onLeaveTap;
  final VoidCallback? onSecondaryTap;
  final bool isMoreContainerOpened;
  final bool isRaised;
  final bool? isMicOn;

  RoomDetailsBottomWidget({
    this.onMorePressed,
    this.isMoreContainerOpened = false,
    this.onLeaveTap,
    this.onSecondaryTap,
    this.isRaised = false,
    this.isMicOn,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: FrostedContainer(
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
            if (isMicOn != null)
              EmojiButton(
                color: theme.primaryColor,
                image: isMicOn! ? Assets.micOn : Assets.micOff,
                text: isMicOn! ? S.of(context).mic_on : S.of(context).mic_off,
                width: 120,
                onTap: onSecondaryTap,
              )
            else
              EmojiButton(
                color: theme.primaryColor,
                image: Assets.handRaise,
                imageHeight: isRaised ? 56 : null,
                text: isRaised ? S.of(context).raised : S.of(context).raise,
                width: 112,
                onTap: onSecondaryTap,
              ),
          ],
        ),
      ),
    );
  }
}
