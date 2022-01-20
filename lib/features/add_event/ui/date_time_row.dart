import 'package:clubroom/components/custom_text_field.dart';
import 'package:flutter/material.dart';

class DateTimeRow extends StatefulWidget {
  @override
  _DateTimeRowState createState() => _DateTimeRowState();
}

class _DateTimeRowState extends State<DateTimeRow> {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            controller: _dateController,
            textColor: theme.primaryColor,
            prefixIcon: Icon(
              Icons.date_range,
              color: theme.disabledColor,
              size: 20,
            ),
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(DateTime.now().year + 2),
              ).then((value) {
                if (value != null) {
                  _dateController.text =
                      "${value.day}/${value.month}/${value.year}";
                }
              });
            },
            readOnly: true,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: CustomTextField(
            controller: _timeController,
            textColor: theme.primaryColor,
            prefixIcon: Icon(
              Icons.access_time,
              color: theme.disabledColor,
              size: 20,
            ),
            onTap: () {
              showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              ).then((value) {
                if (value != null) {
                  _timeController.text = value.format(context);
                }
              });
            },
            readOnly: true,
          ),
        ),
      ],
    );
  }
}
