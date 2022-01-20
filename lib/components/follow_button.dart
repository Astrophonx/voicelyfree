import 'package:clubroom/generated/l10n.dart';
import 'package:flutter/material.dart';

class FollowButton extends StatelessWidget {
  final bool isFollowing;
  final VoidCallback? onTap;

  FollowButton({this.isFollowing = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return MaterialButton(
      onPressed: onTap,
      minWidth: 116,
      color: theme.scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: theme.primaryColor),
      ),
      child: Text(
        isFollowing ? S.of(context).following : S.of(context).follow,
        style: theme.textTheme.button!.copyWith(color: theme.primaryColor),
      ),
    );
  }
}
