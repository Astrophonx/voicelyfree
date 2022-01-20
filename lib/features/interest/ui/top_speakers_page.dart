import 'package:clubroom/components/custom_button.dart';
import 'package:clubroom/features/interest/ui/top_speakers_grid.dart';
import 'package:clubroom/features/interest/interest_navigator.dart';
import 'package:clubroom/generated/l10n.dart';
import 'package:clubroom/models/speaker_data.dart';
import 'package:clubroom/utils/selection_tracker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopSpeakersPage extends StatefulWidget {
  @override
  _TopSpeakersPageState createState() => _TopSpeakersPageState();
}

class _TopSpeakersPageState extends State<TopSpeakersPage> {
  SelectionTracker<int> _selectionTracker = SelectionTracker<int>();

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
    return Scaffold(
      appBar: AppBar(
        title: Text(s.top_speakers.toUpperCase()),
        centerTitle: true,
      ),
      body: TopSpeakersGrid(speakers, _selectionTracker),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _selectionTracker.getSelectedItems().isNotEmpty
          ? CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, InterestRoutes.interests);
              },
            )
          : null,
    );
  }
}
