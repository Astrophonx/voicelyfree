import 'package:clubroom/components/custom_text_field.dart';
import 'package:clubroom/features/explore/ui/rooms_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clubroom/generated/l10n.dart';
import 'package:flutter/widgets.dart';

import 'people_tab.dart';

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(s.explore.toUpperCase()),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: CustomTextField(
              prefixIcon: Icon(Icons.search, color: theme.disabledColor),
              isFilled: false,
              hint: s.search_people_and_rooms,
            ),
          ),
          DefaultTabController(
            length: 2,
            child: Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: theme.scaffoldBackgroundColor,
                          width: 4,
                        ),
                      ),
                      child: TabBar(
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: theme.primaryColor,
                        ),
                        unselectedLabelColor: theme.disabledColor,
                        tabs: [
                          Tab(text: s.people),
                          Tab(text: s.room),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          PeopleTab(),
                          RoomsTab(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
