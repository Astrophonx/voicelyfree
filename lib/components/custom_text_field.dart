import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextField extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? initialValue;
  final bool showUnderline;
  final bool readOnly;
  final EdgeInsetsGeometry? padding;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final GestureTapCallback? onTap;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final Color? textColor;
  final int? maxLines;
  final bool isFilled;

  CustomTextField({
    this.hint,
    this.controller,
    this.keyboardType,
    this.initialValue,
    this.showUnderline = true,
    this.readOnly = false,
    this.padding,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.textCapitalization = TextCapitalization.sentences,
    this.textAlign = TextAlign.start,
    this.textColor,
    this.maxLines,
    this.isFilled = true,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextFormField(
      controller: controller,
      style: theme.textTheme.bodyText1!
          .copyWith(color: textColor ?? theme.textTheme.bodyText1!.color),
      keyboardType: keyboardType,
      initialValue: initialValue,
      textCapitalization: textCapitalization,
      onTap: onTap,
      readOnly: readOnly,
      textAlign: textAlign,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: theme.textTheme.bodyText1!.copyWith(color: theme.hintColor),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: isFilled,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        fillColor: theme.cardColor,
        enabledBorder: isFilled
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              )
            : UnderlineInputBorder(
                borderSide: BorderSide(color: theme.cardColor, width: 4),
              ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
