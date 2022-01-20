import 'package:clubroom/components/constants.dart';
import 'package:clubroom/models/faq_data.dart';
import 'package:flutter/material.dart';
import 'package:clubroom/generated/l10n.dart';

class FaqsPage extends StatefulWidget {
  @override
  _FaqsPageState createState() => _FaqsPageState();
}

class _FaqsPageState extends State<FaqsPage> with TickerProviderStateMixin {
  List<int> _openedQuestions = [0];

  final List<Faq> faqs = [
    Faq("How is lorem ipsum?", kLoremText1),
    Faq("What is lorem ipsum?", kLoremText2),
    Faq("How to set your lorem ipsum?", kLoremText3),
    Faq("Why there are lorem ipsum in the app?", kLoremText1),
    Faq("How is lorem ipsum?", kLoremText1),
    Faq("What is lorem ipsum?", kLoremText2),
    Faq("How to set your lorem ipsum?", kLoremText3),
    Faq("Why there are lorem ipsum in the app?", kLoremText1),
    Faq("How is lorem ipsum?", kLoremText1),
    Faq("What is lorem ipsum?", kLoremText2),
    Faq("How to set your lorem ipsum?", kLoremText3),
    Faq("Why there are lorem ipsum in the app?", kLoremText1),
    Faq("How is lorem ipsum?", kLoremText1),
    Faq("What is lorem ipsum?", kLoremText2),
    Faq("How to set your lorem ipsum?", kLoremText3),
    Faq("Why there are lorem ipsum in the app?", kLoremText1),
  ];

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(s.faqs.toUpperCase()),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        physics: BouncingScrollPhysics(),
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          var contains = _openedQuestions.contains(index);
          return InkWell(
            onTap: () {
              if (contains) {
                _openedQuestions.remove(index);
              } else {
                _openedQuestions.add(index);
              }
              setState(() {});
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    faqs[index].question,
                    style: theme.textTheme.headline6!.copyWith(fontSize: 16),
                  ),
                  AnimatedSize(
                    duration: Duration(milliseconds: 300),
                    vsync: this,
                    child: contains
                        ? Text(
                            faqs[index].answer,
                            style:
                                theme.textTheme.caption!.copyWith(height: 1.7),
                          )
                        : SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
