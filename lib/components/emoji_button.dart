import 'package:flutter/material.dart';

class EmojiButton extends StatelessWidget {
  final Color color;
  final String image;
  final GestureTapCallback? onTap;
  final String? text;
  final double height;
  final double width;
  final double? start;
  final double? bottom;
  final double? end;
  final AlignmentGeometry alignment;
  final double? imageHeight;

  EmojiButton({
    required this.color,
    required this.image,
    this.text,
    this.onTap,
    this.height = 36,
    this.width = 52,
    this.start,
    this.bottom,
    this.end,
    this.alignment = AlignmentDirectional.centerEnd,
    this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: alignment == Alignment.bottomCenter
                ? EdgeInsets.fromLTRB(16, 0, 16, 12)
                : EdgeInsetsDirectional.only(end: 16),
            alignment: alignment,
            child: text != null
                ? Text(
                    text!,
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                : SizedBox.shrink(),
          ),
          PositionedDirectional(
            start: start ?? 8,
            bottom: bottom ?? 0,
            end: end,
            child: Image.asset(
              image,
              height: imageHeight ?? 48,
              width: imageHeight != null ? 44 : 36,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
