import 'package:clubroom/features/home/components/upcoming_rooms_list.dart';
import 'package:clubroom/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:clubroom/generated/l10n.dart';
import 'package:flutter/widgets.dart';

class UpcomingTab extends StatefulWidget {
  @override
  _UpcomingTabState createState() => _UpcomingTabState();
}

class _UpcomingTabState extends State<UpcomingTab> {
  bool isAll = true;

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              buildChoiceChip(
                s.all,
                isAll,
                onSelected: (value) {
                  setState(() {
                    isAll = true;
                  });
                },
              ),
              SizedBox(width: 8),
              buildChoiceChip(
                s.my_events,
                !isAll,
                onSelected: (value) {
                  setState(() {
                    isAll = false;
                  });
                },
              ),
              Spacer(),
              Expanded(
                flex: 10,
                child: FloatingActionButton.extended(
                  onPressed: () =>
                      Navigator.pushNamed(context, PageRoutes.addEventPage),
                  label: Text(s.add_event),
                  icon: Icon(Icons.add, size: 16),
                  foregroundColor: theme.accentColor,
                  backgroundColor: theme.primaryColor,
                ),
              ),
            ],
          ),
        ),
        UpcomingRoomsList(isAll),
      ],
    );
  }

  ChoiceChip buildChoiceChip(
    String text,
    bool isSelected, {
    ValueChanged<bool>? onSelected,
  }) {
    var theme = Theme.of(context);
    return ChoiceChip(
      label: Text(text),
      selected: isSelected,
      onSelected: onSelected,
      selectedColor: theme.cardColor,
      backgroundColor: theme.scaffoldBackgroundColor,
      labelStyle: theme.textTheme.bodyText1!.copyWith(
          color: isSelected ? theme.accentColor : theme.disabledColor),
      elevation: 0,
      side: BorderSide(color: theme.cardColor, width: 2),
      labelPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }
}
