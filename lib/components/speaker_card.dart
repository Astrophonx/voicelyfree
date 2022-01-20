import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:clubroom/components/curved_image.dart';
import 'package:clubroom/components/ripple_animation.dart';
import 'package:clubroom/models/speaker_data.dart';
import 'package:flutter/material.dart';

class SpeakerCard extends StatelessWidget {
  final Speaker speaker;
  final IconData? icon;
  final Color? bgColor;
  final Color? fgColor;
  final GestureTapCallback? onTap;
  final bool showAnimation;
  final bool showIcon;
  final double? height;
  final double radius;
  final CrossAxisAlignment crossAxisAlignment;

  SpeakerCard(
    this.speaker, {
    this.icon,
    this.bgColor,
    this.fgColor,
    this.onTap,
    this.showAnimation = false,
    this.showIcon = false,
    this.height,
    this.radius = 24,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: crossAxisAlignment,
            children: [
              if (showAnimation && icon != null)
                RippleAnimation(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26),
                      border: Border.all(color: theme.primaryColor, width: 2),
                    ),
                    child: CurvedImage(
                      speaker.image,
                      height: height,
                      radius: radius,
                    ),
                  ),
                  repeat: true,
                  color: theme.primaryColor,
                  minRadius: 36,
                )
              else
                CurvedImage(speaker.image, height: height, radius: radius),
              SizedBox(height: 8),
              Text(
                speaker.name,
                style: theme.textTheme.caption,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          if (icon != null && showIcon && !showAnimation) selectedIcon(theme),
        ],
      ),
    );
  }

  PositionedDirectional selectedIcon(ThemeData theme) {
    return PositionedDirectional(
      end: 0,
      bottom: 28,
      child: FadedScaleAnimation(
        child: CircleAvatar(
          backgroundColor: bgColor ?? theme.primaryColor,
          foregroundColor: fgColor ?? theme.accentColor,
          radius: 10,
          child: Icon(icon, size: 12),
        ),
        durationInMilliseconds: 250,
      ),
    );
  }
}
