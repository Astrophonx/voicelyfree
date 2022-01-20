import 'package:clubroom/components/small_icon.dart';
import 'package:flutter/material.dart';

class CategoryRow extends StatelessWidget {
  final String category;

  CategoryRow(this.category);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      children: [
        Text(
          category.toUpperCase(),
          style: theme.textTheme.overline,
        ),
        SizedBox(width: 8),
        SmallIcon(Icons.flag, color: theme.primaryColor),
      ],
    );
  }
}
