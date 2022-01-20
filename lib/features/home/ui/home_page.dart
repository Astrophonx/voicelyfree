import 'package:animations/animations.dart';
import 'package:clubroom/app_config/app_config.dart';
import 'package:clubroom/components/my_profile_button.dart';
import 'package:clubroom/features/home/components/in_room_widget.dart';
import 'package:clubroom/features/home/components/room_card.dart';
import 'package:clubroom/features/home/ui/start_a_room_sheet.dart';
import 'package:clubroom/features/home/ui/upcoming_tab.dart';
import 'package:clubroom/features/room/ui/room_details_page.dart';
import 'package:clubroom/generated/l10n.dart';
import 'package:clubroom/models/room_data.dart';
import 'package:clubroom/models/speaker_data.dart';
import 'package:clubroom/routes/routes.dart';
import 'package:clubroom/utils/sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

part 'live_tab.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Tab> _tabs = [
      Tab(text: S.of(context).live.toUpperCase()),
      Tab(text: S.of(context).upcoming.toUpperCase()),
    ];
    var theme = Theme.of(context);
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: TabBar(
            physics: BouncingScrollPhysics(),
            labelColor: theme.primaryColor,
            unselectedLabelColor: theme.dividerColor,
            indicatorColor: theme.primaryColor,
            indicatorPadding: EdgeInsetsDirectional.only(start: 16, end: 28),
            isScrollable: true,
            tabs: _tabs,
          ),
          actions: [
            IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, PageRoutes.explorePage),
              icon: Icon(Icons.search),
              color: theme.disabledColor,
            ),
            IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, PageRoutes.walletPage),
              icon: Icon(Icons.account_balance_wallet),
              color: theme.disabledColor,
            ),
            IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, PageRoutes.activityPage),
              icon: Icon(Icons.notifications_rounded),
              color: theme.disabledColor,
            ),
            MyProfileButton(),
          ],
        ),
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            LiveTab(),
            UpcomingTab(),
          ],
        ),
      ),
    );
  }
}
