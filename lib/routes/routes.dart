import 'package:clubroom/features/activity/ui/activity_page.dart';
import 'package:clubroom/features/add_event/ui/add_event_page.dart';
import 'package:clubroom/features/explore/ui/explore_page.dart';
import 'package:clubroom/features/home/ui/home_page.dart';
import 'package:clubroom/features/interest/interest_navigator.dart';
import 'package:clubroom/features/payment/confirm_payment_page.dart';
import 'package:clubroom/features/payment/payment_done_page.dart';
import 'package:clubroom/features/settings/ui/faqs_page.dart';
import 'package:clubroom/features/settings/ui/settings_page.dart';
import 'package:clubroom/features/settings/ui/terms_page.dart';
import 'package:clubroom/features/wallet/ui/wallet_page.dart';
import 'package:flutter/material.dart';

class PageRoutes {
  static const String interestNavigator = "interest_navigator";
  static const String homePage = "home_page";
  static const String confirmPaymentPage = "confirm_payment_page";
  static const String paymentDonePage = "payment_done_page";
  static const String settingsPage = "settings_page";
  static const String termsPage = "terms_page";
  static const String faqsPage = "faqs_page";
  static const String addEventPage = "add_event_page";
  static const String explorePage = "explore_page";
  static const String walletPage = "wallet_page";
  static const String activityPage = "activity_page";

  static Map<String, WidgetBuilder> routes() {
    return {
      interestNavigator: (context) => InterestNavigator(),
      homePage: (context) => HomePage(),
      confirmPaymentPage: (context) => ConfirmPaymentPage(),
      paymentDonePage: (context) => PaymentDonePage(),
      settingsPage: (context) => SettingsPage(),
      termsPage: (context) => TermsPage(),
      faqsPage: (context) => FaqsPage(),
      addEventPage: (context) => AddEventPage(),
      explorePage: (context) => ExplorePage(),
      walletPage: (context) => WalletPage(),
      activityPage: (context) => ActivityPage(),
    };
  }
}
