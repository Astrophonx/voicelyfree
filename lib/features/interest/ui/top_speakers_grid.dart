import 'package:clubroom/components/speaker_card.dart';
import 'package:clubroom/models/speaker_data.dart';
import 'package:clubroom/utils/selection_tracker.dart';
import 'package:flutter/material.dart';

class TopSpeakersGrid extends StatelessWidget {
  final List<Speaker> speakers;
  final SelectionTracker<int> _selectionTracker;

  TopSpeakersGrid(
    this.speakers,
    this._selectionTracker,
  );

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.fromLTRB(30, 30, 30, 72),
      physics: BouncingScrollPhysics(),
      itemCount: speakers.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.67,
      ),
      itemBuilder: (context, index) {
        var speaker = speakers[index];
        bool isSelected = _selectionTracker.isSelected(index);
        return SpeakerCard(
          speaker,
          icon: Icons.check,
          showIcon: isSelected,
          onTap: () => _selectionTracker.setSelected(index, !isSelected),
        );
      },
    );
  }
}
