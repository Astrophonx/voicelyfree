import 'package:clubroom/components/custom_button.dart';
import 'package:clubroom/components/custom_text_field.dart';
import 'package:clubroom/features/auth/auth_interactors.dart';
import 'package:clubroom/logic/helper.dart';
import 'package:flutter/material.dart';
import 'package:clubroom/generated/l10n.dart';

part 'registration_ui.dart';

class RegistrationPage extends StatelessWidget {
  final VoidCallback onRegistrationDone;

  RegistrationPage(this.onRegistrationDone);

  @override
  Widget build(BuildContext context) {
    return RegistrationBody(onRegistrationDone);
  }
}

class RegistrationBody extends StatefulWidget {
  final VoidCallback onRegistrationDone;

  RegistrationBody(this.onRegistrationDone);

  @override
  _RegistrationBodyState createState() => _RegistrationBodyState();
}

class _RegistrationBodyState extends State<RegistrationBody>
    implements RegistrationInteractor {
  @override
  Widget build(BuildContext context) {
    return RegistrationUI(this);
  }

  @override
  void resister(String userName) {
    widget.onRegistrationDone();
  }
}
