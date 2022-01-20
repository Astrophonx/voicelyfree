import 'package:clubroom/features/interest/ui/interests_page.dart';
import 'package:clubroom/features/interest/ui/top_speakers_page.dart';
import 'package:clubroom/routes/routes.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> interestNavigatorKey =
    GlobalKey<NavigatorState>();

class InterestRoutes {
  static const String topSpeakers = 'topSpeakers';
  static const String interests = 'interests';
}

class InterestNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var canPop = interestNavigatorKey.currentState!.canPop();
        if (canPop) {
          interestNavigatorKey.currentState!.pop();
        }
        return !canPop;
      },
      child: Navigator(
        key: interestNavigatorKey,
        initialRoute: InterestRoutes.topSpeakers,
        onGenerateRoute: (RouteSettings settings) {
          late WidgetBuilder builder;
          switch (settings.name) {
            case InterestRoutes.topSpeakers:
              builder = (BuildContext _) => TopSpeakersPage();
              break;
            case InterestRoutes.interests:
              builder = (BuildContext _) => InterestsPage(() {
                    Navigator.pushReplacementNamed(
                        context, PageRoutes.homePage);
                  });
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
