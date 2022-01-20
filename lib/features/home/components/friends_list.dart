import 'package:clubroom/components/curved_image.dart';
import 'package:clubroom/models/speaker_data.dart';
import 'package:clubroom/utils/selection_tracker.dart';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:clubroom/generated/l10n.dart';

class FriendsList extends StatelessWidget {
  final SelectionTracker<int> _selectionTracker;

  FriendsList(this._selectionTracker);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: speakers.length,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 16),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var speaker = speakers[index];
        bool isSelected = _selectionTracker.isSelected(index);
        return FriendTile(
          speaker,
          () => _selectionTracker.setSelected(index, !isSelected),
          isSelected,
        );
      },
    );
  }
}

class FriendTile extends StatelessWidget {
  final Speaker speaker;
  final GestureTapCallback? onTap;
  final bool isSelected;

  FriendTile(this.speaker, this.onTap, this.isSelected);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(top: 12),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CurvedImage(speaker.image, radius: 18),
        title: Text(speaker.name),
        trailing: FittedBox(
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected
                    ? theme.primaryColor
                    : theme.accentColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    color: theme.accentColor,
                    size: 16,
                  ),
                  SizedBox(width: 4),
                  Text(S.of(context).room),
                  SizedBox(width: 4),
                  Icon(
                    Icons.lock,
                    color: theme.accentColor,
                    size: 16,
                  )
                ],
              ),
            ).frosted(
              borderRadius: BorderRadius.circular(20),
              frostColor: theme.cardColor,
              blur: 2,
            ),
          ),
        ),
      ),
    );
  }
}
