import 'package:clubroom/models/interest_data.dart';
import 'package:flutter/material.dart';

class InterestCard extends StatefulWidget {
  final Interest interest;

  InterestCard(this.interest);

  @override
  _InterestCardState createState() => _InterestCardState();
}

class _InterestCardState extends State<InterestCard> {
  List<String> _selectedTopics = [];

  @override
  Widget build(BuildContext context) {
    int count = (widget.interest.topics.length / 2).round();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.interest.title.toUpperCase(),
          style: Theme.of(context).textTheme.subtitle1,
        ),
        SingleChildScrollView(
          padding: EdgeInsets.only(top: 12, bottom: 20),
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildListView(widget.interest.topics.sublist(0, count)),
              buildListView(widget.interest.topics.sublist(count)),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildListView(List<String> topics) {
    var theme = Theme.of(context);
    return SizedBox(
      height: 48,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: topics.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var topic = topics[index];
          var isSelected = _selectedTopics.contains(topic);
          return Padding(
            padding: EdgeInsetsDirectional.only(end: 8),
            child: ChoiceChip(
              label: Text(topic),
              labelStyle: theme.textTheme.caption!.copyWith(
                  color: isSelected ? theme.accentColor : theme.primaryColor,
                  fontWeight: FontWeight.bold),
              backgroundColor: theme.scaffoldBackgroundColor,
              selected: isSelected,
              selectedColor: theme.primaryColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: theme.primaryColor),
                borderRadius: BorderRadius.circular(20),
              ),
              onSelected: (value) {
                if (value) {
                  _selectedTopics.add(topic);
                } else {
                  _selectedTopics.remove(topic);
                }
                setState(() {});
              },
            ),
          );
        },
      ),
    );
  }
}
