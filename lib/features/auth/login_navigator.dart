import 'package:clubroom/routes/routes.dart';
import 'package:flutter/material.dart';

import 'login/ui/login_page.dart';
import 'registration/ui/registration_page.dart';
import 'verification/ui/verification_page.dart';

final GlobalKey<NavigatorState> loginNavigatorKey = GlobalKey<NavigatorState>();

class LoginRoutes {
  static const String loginRoot = 'login/';
  static const String registration = 'login/registration';
  static const String verification = 'login/verification';
}

class LoginNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var canPop = loginNavigatorKey.currentState!.canPop();
        if (canPop) {
          loginNavigatorKey.currentState!.pop();
        }
        return !canPop;
      },
      child: Navigator(
        key: loginNavigatorKey,
        initialRoute: LoginRoutes.loginRoot,
        onGenerateRoute: (RouteSettings settings) {
          late WidgetBuilder builder;
          switch (settings.name) {
            case LoginRoutes.loginRoot:
              builder = (BuildContext _) => LoginPage();
              break;

            case LoginRoutes.verification:
              builder = (BuildContext _) => VerificationPage();
              break;
            case LoginRoutes.registration:
              builder = (BuildContext _) => RegistrationPage(
                    () {
                      Navigator.pushReplacementNamed(
                          context, PageRoutes.interestNavigator);
                    },
                  );
              break;
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
        onPopPage: (Route<dynamic> route, dynamic result) {
          return route.didPop(result);
        },
      ),
    );
  }
}
