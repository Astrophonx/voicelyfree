import 'package:clubroom/assets/assets.dart';
import 'package:clubroom/components/frosted_container.dart';
import 'package:clubroom/components/emoji_button.dart';
import 'package:clubroom/components/stacked_images.dart';
import 'package:clubroom/features/home/ui/home_page.dart';
import 'package:clubroom/models/speaker_data.dart';
import 'package:flutter/material.dart';

class InRoomWidget extends StatefulWidget {
  final VoidCallback onLeaveTap;

  InRoomWidget(this.onLeaveTap);

  @override
  _InRoomWidgetState createState() => _InRoomWidgetState();
}

class _InRoomWidgetState extends State<InRoomWidget> {
  bool isHandRaised = true;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    if (isInRoom)
      return Align(
        alignment: Alignment.bottomCenter,
        child: FrostedContainer(
          child: Row(
            children: [
              StackedImages(
                speakers.map((e) => e.image).toList(),
                height: 40,
                showLength: true,
                radius: 14,
              ),
              Spacer(),
              EmojiButton(
                color: theme.dividerColor,
                image: Assets.leave,
                onTap: widget.onLeaveTap,
              ),
              SizedBox(width: 20),
              EmojiButton(
                color: isHandRaised ? theme.primaryColor : theme.dividerColor,
                image: Assets.handRaise,
                onTap: () {
                  setState(() {
                    isHandRaised = !isHandRaised;
                  });
                },
              ),
            ],
          ),
        ),
      );
    else
      return SizedBox.shrink();
  }
}
