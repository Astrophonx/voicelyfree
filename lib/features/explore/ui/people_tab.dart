import 'package:clubroom/features/home/components/mentor_list.dart';
import 'package:clubroom/models/speaker_data.dart';
import 'package:flutter/material.dart';
import 'package:clubroom/generated/l10n.dart';

class PeopleTab extends StatelessWidget {
  const PeopleTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Text(
          s.people_you_may_know.toUpperCase(),
          style: Theme.of(context).textTheme.caption,
        ),
        Expanded(
          child: MentorList(
            speakers,
            physics: BouncingScrollPhysics(),
            shrinkWrap: false,
          ),
        ),
      ],
    );
  }
}
