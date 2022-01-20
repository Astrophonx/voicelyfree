import 'package:clubroom/assets/assets.dart';
import 'package:clubroom/components/curved_image.dart';
import 'package:clubroom/components/frosted_container.dart';
import 'package:clubroom/generated/l10n.dart';
import 'package:clubroom/models/speaker_data.dart';
import 'package:clubroom/utils/selection_tracker.dart';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';

class InviteToRoomSheet extends StatefulWidget {
  @override
  _InviteToRoomSheetState createState() => _InviteToRoomSheetState();
}

class _InviteToRoomSheetState extends State<InviteToRoomSheet> {
  bool raisedHands = true;

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
    return FrostedContainer(
      padding: EdgeInsets.only(top: 8),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 6,
                width: 60,
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
            SizedBox(height: 16),
            SwitchListTile(
              value: raisedHands,
              onChanged: (value) {
                setState(() {
                  raisedHands = value;
                });
              },
              title: Text(s.raised),
              secondary: Image.asset(Assets.handRaise),
              inactiveThumbColor: theme.disabledColor,
              inactiveTrackColor: theme.dividerColor.withOpacity(0.5),
            ),
            Divider(
              thickness: 2,
              height: 20,
              color: theme.cardColor,
            ),
            Expanded(child: PeopleList(_selectionTracker)),
          ],
        ),
      ),
    );
  }
}

class PeopleList extends StatelessWidget {
  final SelectionTracker<int> _selectionTracker;

  PeopleList(this._selectionTracker);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: speakers.length,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var speaker = speakers[index];
        bool isSelected = _selectionTracker.isSelected(index);
        return PeopleTile(
          speaker,
          () => _selectionTracker.setSelected(index, !isSelected),
          isSelected,
        );
      },
    );
  }
}

class PeopleTile extends StatelessWidget {
  final Speaker speaker;
  final GestureTapCallback? onTap;
  final bool isSelected;

  PeopleTile(this.speaker, this.onTap, this.isSelected);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListTile(
      contentPadding: EdgeInsets.only(bottom: 12),
      leading: CurvedImage(speaker.image, radius: 18),
      title: Text(speaker.name),
      trailing: FittedBox(
        child: InkWell(
          onTap: onTap,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 800),
            width: 116,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              color: isSelected
                  ? theme.primaryColor
                  : theme.accentColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  isSelected ? Assets.micInvited : Assets.micAdd,
                  scale: 3.6,
                ),
                SizedBox(width: 8),
                Text(isSelected ? S.of(context).invited : S.of(context).invite),
              ],
            ),
          ).frosted(
            borderRadius: BorderRadius.circular(20),
            frostColor: theme.cardColor,
            blur: 2,
          ),
        ),
      ),
    );
  }
}
