import 'package:clubroom/assets/assets.dart';
import 'package:clubroom/components/custom_button.dart';
import 'package:clubroom/components/custom_text_field.dart';
import 'package:clubroom/features/auth/auth_interactors.dart';
import 'package:clubroom/features/auth/login_navigator.dart';
import 'package:clubroom/features/language/ui/language_sheet.dart';
import 'package:clubroom/utils/sheet.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:clubroom/generated/l10n.dart';

part 'login_ui.dart';

part 'custom_country_code_picker.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginInteractor {
  @override
  Widget build(BuildContext context) {
    return LoginUI(this);
  }

  @override
  void loginWithFacebook() {
    Navigator.pushNamed(context, LoginRoutes.verification);
  }

  @override
  void loginWithGoogle() {
    Navigator.pushNamed(context, LoginRoutes.verification);
  }

  @override
  void loginWithMobile(String isoCode, String mobileNumber) {
    Navigator.pushNamed(context, LoginRoutes.verification);
  }
}
