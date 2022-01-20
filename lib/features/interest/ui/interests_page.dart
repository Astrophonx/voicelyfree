import 'package:clubroom/components/custom_button.dart';
import 'package:clubroom/generated/l10n.dart';
import 'package:clubroom/models/interest_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'interest_card.dart';

class InterestsPage extends StatelessWidget {
  final VoidCallback onInterestsSelected;

  InterestsPage(this.onInterestsSelected);

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var interest1 = Interest(
      s.technology,
      [
        s.product,
        s.startup,
        s.venture_capital,
        s.marketing,
        s.engineering,
        s.crypto,
        s.vr_ar,
      ],
    );
    var interest2 = Interest(
      s.knowledge,
      [
        s.maths,
        s.biology,
        s.science,
        s.history,
        s.space,
        s.education,
        s.physics,
        s.psychology,
      ],
    );
    List<Interest> interests = [
      interest1,
      interest2,
      interest1,
      interest2,
      interest1,
    ];
    var theme = Theme.of(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(s.interests.toUpperCase()),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 30, 0, 0),
        child: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: size.width * 0.7),
              child: Text(
                s.add_more_interests,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyText2!
                    .copyWith(color: theme.dividerColor),
              ),
            ),
            SizedBox(height: 40),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(bottom: 60),
                itemCount: interests.length,
                itemBuilder: (context, index) {
                  return InterestCard(interests[index]);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButton(
        onPressed: onInterestsSelected,
      ),
    );
  }
}
