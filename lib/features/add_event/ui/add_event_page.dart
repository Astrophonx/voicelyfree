import 'package:clubroom/components/custom_button.dart';
import 'package:clubroom/components/custom_text_field.dart';
import 'package:clubroom/features/add_event/ui/host_tile.dart';
import 'package:clubroom/features/add_event/ui/price_section.dart';
import 'package:clubroom/models/speaker_data.dart';
import 'package:flutter/material.dart';
import 'package:clubroom/generated/l10n.dart';
import 'package:clubroom/extensions/iterable_extentions.dart';
import 'package:flutter/widgets.dart';

import 'date_time_row.dart';

class AddEventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(s.add_event.toUpperCase()),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 4),
            child: CustomButton(
              width: 120,
              text: s.publish,
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: [
          CustomTextField(
            hint: s.event_name,
          ),
          SizedBox(height: 30),
          Text(
            s.select_co_host_or_guest,
            style: theme.textTheme.caption,
          ),
          SizedBox(height: 16),
          HostTile(speakers.first, isMe: true),
          HostTile(speakers.second!),
          addCoHostTile(context),
          SizedBox(height: 30),
          Text(
            s.select_event_date_and_time,
            style: theme.textTheme.caption,
          ),
          SizedBox(height: 16),
          DateTimeRow(),
          SizedBox(height: 16),
          PriceSection(),
          SizedBox(height: 30),
          Text(
            s.description,
            style: theme.textTheme.caption,
          ),
          SizedBox(height: 16),
          CustomTextField(
            hint: s.enter_description,
            maxLines: 5,
          )
        ],
      ),
    );
  }

  DecoratedBox addCoHostTile(BuildContext context) {
    var leadingHeight = MediaQuery.of(context).size.width * 0.1;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Theme.of(context).cardColor,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 8),
        dense: true,
        leading: Container(
          height: leadingHeight,
          width: leadingHeight,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(17),
          ),
          child: Icon(Icons.add, color: Theme.of(context).accentColor),
        ),
        title: Text(S.of(context).add_co_host_or_guest),
      ),
    );
  }
}
