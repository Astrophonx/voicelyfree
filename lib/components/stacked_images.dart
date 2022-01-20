import 'package:clubroom/app_config/app_theme.dart';
import 'package:clubroom/components/curved_image.dart';
import 'package:clubroom/logic/variables.dart';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';

class StackedImages extends StatelessWidget {
  final List<String> images;
  final double height;
  final int length;
  final bool showLength;
  final double radius;

  StackedImages(
    this.images, {
    this.height = 48,
    this.length = 3,
    this.showLength = false,
    this.radius = 16,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      width: (height * length) + 12,
      child: Stack(
        children: List.generate(
          length,
          (index) {
            var image = images[index];
            if (index == 0)
              return CurvedImage(image, height: height, radius: radius);
            else
              return PositionedDirectional(
                start: index * (height - 12),
                child: CurvedImage(image, height: height, radius: radius),
              );
          },
        )..add(showLength
            ? PositionedDirectional(
                start: 3 * (height - 12),
                child: Container(
                  height: height,
                  width: height,
                  alignment: Alignment.center,
                  color: themeData == AppTheme.lightTheme
                      ? theme.cardColor.withOpacity(0.4)
                      : theme.accentColor.withOpacity(0.3),
                  child: Text(
                    "${images.length - 3}+",
                    style: theme.textTheme.caption!
                        .copyWith(color: theme.accentColor),
                  ),
                ).frosted(
                  borderRadius: BorderRadius.circular(radius),
                  frostColor: theme.cardColor,
                  blur: 2,
                ),
              )
            : SizedBox()),
      ),
    );
  }
}
