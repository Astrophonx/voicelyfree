import 'package:animations/animations.dart';
import 'package:clubroom/components/speaker_card.dart';
import 'package:clubroom/features/user_profile/ui/user_profile_page.dart';
import 'package:clubroom/features/user_profile/ui/user_profile_sheet.dart';
import 'package:clubroom/models/speaker_data.dart';
import 'package:clubroom/utils/sheet.dart';
import 'package:flutter/material.dart';

class SpeakersGrid extends StatelessWidget {
  final List<Speaker> speakers;
  final bool showIcon;
  final int crossAxisCount;

  SpeakersGrid(this.speakers, this.showIcon, {this.crossAxisCount = 3});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GridView.builder(
      padding: EdgeInsets.fromLTRB(40, 30, 40, 16),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: speakers.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisCount < 4 ? 32 : 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.63,
      ),
      itemBuilder: (context, index) {
        var speaker = speakers[index];
        return SpeakerCard(
          speaker,
          showIcon: showIcon,
          icon: showIcon ? Icons.mic_off : null,
          bgColor: theme.cardColor,
          fgColor: theme.disabledColor,
          showAnimation: index.isEven,
          onTap: () => Sheet.openFrosted(
            context,
            OpenContainer(
              closedColor: Colors.transparent,
              closedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              tappable: false,
              openBuilder: (context, action) {
                return UserProfilePage(speaker);
              },
              closedBuilder: (context, action) {
                return UserProfileSheet(speaker, action);
              },
            ),
          ),
        );
      },
    );
  }
}
