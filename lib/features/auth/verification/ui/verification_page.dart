import 'package:clubroom/components/custom_button.dart';
import 'package:clubroom/components/custom_text_field.dart';
import 'package:clubroom/features/auth/auth_interactors.dart';
import 'package:clubroom/features/auth/login_navigator.dart';
import 'package:clubroom/logic/helper.dart';
import 'package:flutter/material.dart';
import 'package:clubroom/generated/l10n.dart';

part 'verification_ui.dart';

class VerificationPage extends StatefulWidget {
  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage>
    implements VerificationInteractor {
  @override
  Widget build(BuildContext context) {
    return VerificationUI(this);
  }

  @override
  void verify() {
    Navigator.pushNamed(context, LoginRoutes.registration);
  }
}
