// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `App Language`
  String get app_language {
    return Intl.message(
      'App Language',
      name: 'app_language',
      desc: '',
      args: [],
    );
  }

  /// `Select Country`
  String get select_country {
    return Intl.message(
      'Select Country',
      name: 'select_country',
      desc: '',
      args: [],
    );
  }

  /// `Enter Phone number`
  String get enter_phone_number {
    return Intl.message(
      'Enter Phone number',
      name: 'enter_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verification {
    return Intl.message(
      'Verification',
      name: 'verification',
      desc: '',
      args: [],
    );
  }

  /// `Enter Verification code sent on your given number.`
  String get enter_verification_code {
    return Intl.message(
      'Enter Verification code sent on your given number.',
      name: 'enter_verification_code',
      desc: '',
      args: [],
    );
  }

  /// `Enter code here`
  String get enter_code_here {
    return Intl.message(
      'Enter code here',
      name: 'enter_code_here',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive it?`
  String get did_not_receive_it {
    return Intl.message(
      'Didn\'t receive it?',
      name: 'did_not_receive_it',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message(
      'Resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Great now let us know how you're look a like.`
  String get great_now_let_us {
    return Intl.message(
      'Great now let us know how you\'re look a like.',
      name: 'great_now_let_us',
      desc: '',
      args: [],
    );
  }

  /// `Set a username`
  String get set_a_username {
    return Intl.message(
      'Set a username',
      name: 'set_a_username',
      desc: '',
      args: [],
    );
  }

  /// `Top Speakers`
  String get top_speakers {
    return Intl.message(
      'Top Speakers',
      name: 'top_speakers',
      desc: '',
      args: [],
    );
  }

  /// `Interests`
  String get interests {
    return Intl.message(
      'Interests',
      name: 'interests',
      desc: '',
      args: [],
    );
  }

  /// `Add more interests so we can provide best related rooms for you`
  String get add_more_interests {
    return Intl.message(
      'Add more interests so we can provide best related rooms for you',
      name: 'add_more_interests',
      desc: '',
      args: [],
    );
  }

  /// `Technology`
  String get technology {
    return Intl.message(
      'Technology',
      name: 'technology',
      desc: '',
      args: [],
    );
  }

  /// `Knowledge`
  String get knowledge {
    return Intl.message(
      'Knowledge',
      name: 'knowledge',
      desc: '',
      args: [],
    );
  }

  /// `Product`
  String get product {
    return Intl.message(
      'Product',
      name: 'product',
      desc: '',
      args: [],
    );
  }

  /// `Startup`
  String get startup {
    return Intl.message(
      'Startup',
      name: 'startup',
      desc: '',
      args: [],
    );
  }

  /// `Marketing`
  String get marketing {
    return Intl.message(
      'Marketing',
      name: 'marketing',
      desc: '',
      args: [],
    );
  }

  /// `Engineering`
  String get engineering {
    return Intl.message(
      'Engineering',
      name: 'engineering',
      desc: '',
      args: [],
    );
  }

  /// `Crypto`
  String get crypto {
    return Intl.message(
      'Crypto',
      name: 'crypto',
      desc: '',
      args: [],
    );
  }

  /// `Venture Capital`
  String get venture_capital {
    return Intl.message(
      'Venture Capital',
      name: 'venture_capital',
      desc: '',
      args: [],
    );
  }

  /// `VR/AR`
  String get vr_ar {
    return Intl.message(
      'VR/AR',
      name: 'vr_ar',
      desc: '',
      args: [],
    );
  }

  /// `Maths`
  String get maths {
    return Intl.message(
      'Maths',
      name: 'maths',
      desc: '',
      args: [],
    );
  }

  /// `Biology`
  String get biology {
    return Intl.message(
      'Biology',
      name: 'biology',
      desc: '',
      args: [],
    );
  }

  /// `Science`
  String get science {
    return Intl.message(
      'Science',
      name: 'science',
      desc: '',
      args: [],
    );
  }

  /// `Space`
  String get space {
    return Intl.message(
      'Space',
      name: 'space',
      desc: '',
      args: [],
    );
  }

  /// `Physics`
  String get physics {
    return Intl.message(
      'Physics',
      name: 'physics',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Psychology`
  String get psychology {
    return Intl.message(
      'Psychology',
      name: 'psychology',
      desc: '',
      args: [],
    );
  }

  /// `Education`
  String get education {
    return Intl.message(
      'Education',
      name: 'education',
      desc: '',
      args: [],
    );
  }

  /// `Live`
  String get live {
    return Intl.message(
      'Live',
      name: 'live',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming`
  String get upcoming {
    return Intl.message(
      'Upcoming',
      name: 'upcoming',
      desc: '',
      args: [],
    );
  }

  /// `App UI Design`
  String get app_ui_design {
    return Intl.message(
      'App UI Design',
      name: 'app_ui_design',
      desc: '',
      args: [],
    );
  }

  /// `Basics of User Interface Design`
  String get basics_of_ui_design {
    return Intl.message(
      'Basics of User Interface Design',
      name: 'basics_of_ui_design',
      desc: '',
      args: [],
    );
  }

  /// `United Photography Camera`
  String get united_photography_camera {
    return Intl.message(
      'United Photography Camera',
      name: 'united_photography_camera',
      desc: '',
      args: [],
    );
  }

  /// `World Camera Day | First Camera`
  String get world_camera_day {
    return Intl.message(
      'World Camera Day | First Camera',
      name: 'world_camera_day',
      desc: '',
      args: [],
    );
  }

  /// `Start a room`
  String get start_a_room {
    return Intl.message(
      'Start a room',
      name: 'start_a_room',
      desc: '',
      args: [],
    );
  }

  /// `Other Listeners`
  String get other_listeners {
    return Intl.message(
      'Other Listeners',
      name: 'other_listeners',
      desc: '',
      args: [],
    );
  }

  /// `Leave`
  String get leave {
    return Intl.message(
      'Leave',
      name: 'leave',
      desc: '',
      args: [],
    );
  }

  /// `Raise`
  String get raise {
    return Intl.message(
      'Raise',
      name: 'raise',
      desc: '',
      args: [],
    );
  }

  /// `Invite to Room`
  String get invite_to_room {
    return Intl.message(
      'Invite to Room',
      name: 'invite_to_room',
      desc: '',
      args: [],
    );
  }

  /// `Search in Room`
  String get search_in_room {
    return Intl.message(
      'Search in Room',
      name: 'search_in_room',
      desc: '',
      args: [],
    );
  }

  /// `Report Room Activity`
  String get report_room_activity {
    return Intl.message(
      'Report Room Activity',
      name: 'report_room_activity',
      desc: '',
      args: [],
    );
  }

  /// `Review Clubroom Rules`
  String get review_clubroom_rules {
    return Intl.message(
      'Review Clubroom Rules',
      name: 'review_clubroom_rules',
      desc: '',
      args: [],
    );
  }

  /// `Raised`
  String get raised {
    return Intl.message(
      'Raised',
      name: 'raised',
      desc: '',
      args: [],
    );
  }

  /// `Mic's on`
  String get mic_on {
    return Intl.message(
      'Mic\'s on',
      name: 'mic_on',
      desc: '',
      args: [],
    );
  }

  /// `Mic's off`
  String get mic_off {
    return Intl.message(
      'Mic\'s off',
      name: 'mic_off',
      desc: '',
      args: [],
    );
  }

  /// `Rules`
  String get rules {
    return Intl.message(
      'Rules',
      name: 'rules',
      desc: '',
      args: [],
    );
  }

  /// `Be kind, always`
  String get rule_one {
    return Intl.message(
      'Be kind, always',
      name: 'rule_one',
      desc: '',
      args: [],
    );
  }

  /// `Don't over react anyway.`
  String get rule_two {
    return Intl.message(
      'Don\'t over react anyway.',
      name: 'rule_two',
      desc: '',
      args: [],
    );
  }

  /// `No Abusing`
  String get rule_three {
    return Intl.message(
      'No Abusing',
      name: 'rule_three',
      desc: '',
      args: [],
    );
  }

  /// `followers`
  String get followers {
    return Intl.message(
      'followers',
      name: 'followers',
      desc: '',
      args: [],
    );
  }

  /// `followings`
  String get followings {
    return Intl.message(
      'followings',
      name: 'followings',
      desc: '',
      args: [],
    );
  }

  /// `Follow`
  String get follow {
    return Intl.message(
      'Follow',
      name: 'follow',
      desc: '',
      args: [],
    );
  }

  /// `Following`
  String get following {
    return Intl.message(
      'Following',
      name: 'following',
      desc: '',
      args: [],
    );
  }

  /// `View full Profile`
  String get view_full_profile {
    return Intl.message(
      'View full Profile',
      name: 'view_full_profile',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Discuss over Pollution Control`
  String get discuss_over {
    return Intl.message(
      'Discuss over Pollution Control',
      name: 'discuss_over',
      desc: '',
      args: [],
    );
  }

  /// `From World Warriors`
  String get from_world_warriors {
    return Intl.message(
      'From World Warriors',
      name: 'from_world_warriors',
      desc: '',
      args: [],
    );
  }

  /// `Member of`
  String get member_of {
    return Intl.message(
      'Member of',
      name: 'member_of',
      desc: '',
      args: [],
    );
  }

  /// `for`
  String get forText {
    return Intl.message(
      'for',
      name: 'forText',
      desc: '',
      args: [],
    );
  }

  /// `people I choose`
  String get people_i_choose {
    return Intl.message(
      'people I choose',
      name: 'people_i_choose',
      desc: '',
      args: [],
    );
  }

  /// `Start Now`
  String get start_now {
    return Intl.message(
      'Start Now',
      name: 'start_now',
      desc: '',
      args: [],
    );
  }

  /// `Add a topic`
  String get add_a_topic {
    return Intl.message(
      'Add a topic',
      name: 'add_a_topic',
      desc: '',
      args: [],
    );
  }

  /// `Public`
  String get public {
    return Intl.message(
      'Public',
      name: 'public',
      desc: '',
      args: [],
    );
  }

  /// `Social`
  String get social {
    return Intl.message(
      'Social',
      name: 'social',
      desc: '',
      args: [],
    );
  }

  /// `Private`
  String get private {
    return Intl.message(
      'Private',
      name: 'private',
      desc: '',
      args: [],
    );
  }

  /// `Or start a Private chat room with`
  String get or_start_a_private {
    return Intl.message(
      'Or start a Private chat room with',
      name: 'or_start_a_private',
      desc: '',
      args: [],
    );
  }

  /// `online friends`
  String get online_friends {
    return Intl.message(
      'online friends',
      name: 'online_friends',
      desc: '',
      args: [],
    );
  }

  /// `Room`
  String get room {
    return Intl.message(
      'Room',
      name: 'room',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Amount available in Wallet`
  String get amount_available {
    return Intl.message(
      'Amount available in Wallet',
      name: 'amount_available',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Ticket Purchase`
  String get confirm_ticket_purchase {
    return Intl.message(
      'Confirm Ticket Purchase',
      name: 'confirm_ticket_purchase',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Remind me`
  String get remind_me {
    return Intl.message(
      'Remind me',
      name: 'remind_me',
      desc: '',
      args: [],
    );
  }

  /// `Total amount to pay`
  String get total_amount_to_pay {
    return Intl.message(
      'Total amount to pay',
      name: 'total_amount_to_pay',
      desc: '',
      args: [],
    );
  }

  /// `Pay via Wallet`
  String get pay_via_wallet {
    return Intl.message(
      'Pay via Wallet',
      name: 'pay_via_wallet',
      desc: '',
      args: [],
    );
  }

  /// `Successful`
  String get successful {
    return Intl.message(
      'Successful',
      name: 'successful',
      desc: '',
      args: [],
    );
  }

  /// `Your ticket purchased confirmed`
  String get your_ticket_purchased_confirmed {
    return Intl.message(
      'Your ticket purchased confirmed',
      name: 'your_ticket_purchased_confirmed',
      desc: '',
      args: [],
    );
  }

  /// `Join clubroom on given date and time.`
  String get join_clubroom {
    return Intl.message(
      'Join clubroom on given date and time.',
      name: 'join_clubroom',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Pause Notifications`
  String get pause_notif {
    return Intl.message(
      'Pause Notifications',
      name: 'pause_notif',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get dark_mode {
    return Intl.message(
      'Dark Mode',
      name: 'dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `FAQs`
  String get faqs {
    return Intl.message(
      'FAQs',
      name: 'faqs',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get tnc {
    return Intl.message(
      'Terms & Conditions',
      name: 'tnc',
      desc: '',
      args: [],
    );
  }

  /// `Community Guidelines`
  String get community_guidelines {
    return Intl.message(
      'Community Guidelines',
      name: 'community_guidelines',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Heading`
  String get heading {
    return Intl.message(
      'Heading',
      name: 'heading',
      desc: '',
      args: [],
    );
  }

  /// `Terms of use`
  String get terms_of_use {
    return Intl.message(
      'Terms of use',
      name: 'terms_of_use',
      desc: '',
      args: [],
    );
  }

  /// `The Room for beginners to ask questions and get advice from more experienced forum members.`
  String get the_room_for_beginners {
    return Intl.message(
      'The Room for beginners to ask questions and get advice from more experienced forum members.',
      name: 'the_room_for_beginners',
      desc: '',
      args: [],
    );
  }

  /// `We don't have to accept gloom and doom for our planet. New science shows there's a clear path toward a more sustainable future.`
  String get we_do_not_have_to {
    return Intl.message(
      'We don\'t have to accept gloom and doom for our planet. New science shows there\'s a clear path toward a more sustainable future.',
      name: 'we_do_not_have_to',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `My Events`
  String get my_events {
    return Intl.message(
      'My Events',
      name: 'my_events',
      desc: '',
      args: [],
    );
  }

  /// `Add Event`
  String get add_event {
    return Intl.message(
      'Add Event',
      name: 'add_event',
      desc: '',
      args: [],
    );
  }

  /// `Mentors`
  String get mentors {
    return Intl.message(
      'Mentors',
      name: 'mentors',
      desc: '',
      args: [],
    );
  }

  /// `Ticket charge`
  String get ticket_charge {
    return Intl.message(
      'Ticket charge',
      name: 'ticket_charge',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Buy a Ticket`
  String get buy_a_ticket {
    return Intl.message(
      'Buy a Ticket',
      name: 'buy_a_ticket',
      desc: '',
      args: [],
    );
  }

  /// `Publish`
  String get publish {
    return Intl.message(
      'Publish',
      name: 'publish',
      desc: '',
      args: [],
    );
  }

  /// `Event Name`
  String get event_name {
    return Intl.message(
      'Event Name',
      name: 'event_name',
      desc: '',
      args: [],
    );
  }

  /// `Select Co-host or Guest`
  String get select_co_host_or_guest {
    return Intl.message(
      'Select Co-host or Guest',
      name: 'select_co_host_or_guest',
      desc: '',
      args: [],
    );
  }

  /// `Add Co-host or Guest`
  String get add_co_host_or_guest {
    return Intl.message(
      'Add Co-host or Guest',
      name: 'add_co_host_or_guest',
      desc: '',
      args: [],
    );
  }

  /// `Select Event date & Time`
  String get select_event_date_and_time {
    return Intl.message(
      'Select Event date & Time',
      name: 'select_event_date_and_time',
      desc: '',
      args: [],
    );
  }

  /// `Paid Event?`
  String get paid_event {
    return Intl.message(
      'Paid Event?',
      name: 'paid_event',
      desc: '',
      args: [],
    );
  }

  /// `Enter Ticket Amount`
  String get enter_ticket_amount {
    return Intl.message(
      'Enter Ticket Amount',
      name: 'enter_ticket_amount',
      desc: '',
      args: [],
    );
  }

  /// `in`
  String get inText {
    return Intl.message(
      'in',
      name: 'inText',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Enter Description`
  String get enter_description {
    return Intl.message(
      'Enter Description',
      name: 'enter_description',
      desc: '',
      args: [],
    );
  }

  /// `Explore`
  String get explore {
    return Intl.message(
      'Explore',
      name: 'explore',
      desc: '',
      args: [],
    );
  }

  /// `Search People and Rooms`
  String get search_people_and_rooms {
    return Intl.message(
      'Search People and Rooms',
      name: 'search_people_and_rooms',
      desc: '',
      args: [],
    );
  }

  /// `People you may follow`
  String get people_you_may_know {
    return Intl.message(
      'People you may follow',
      name: 'people_you_may_know',
      desc: '',
      args: [],
    );
  }

  /// `People`
  String get people {
    return Intl.message(
      'People',
      name: 'people',
      desc: '',
      args: [],
    );
  }

  /// `Rooms`
  String get rooms {
    return Intl.message(
      'Rooms',
      name: 'rooms',
      desc: '',
      args: [],
    );
  }

  /// `Members`
  String get members {
    return Intl.message(
      'Members',
      name: 'members',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get wallet {
    return Intl.message(
      'Wallet',
      name: 'wallet',
      desc: '',
      args: [],
    );
  }

  /// `Available amount in Wallet`
  String get available_amount_in_wallet {
    return Intl.message(
      'Available amount in Wallet',
      name: 'available_amount_in_wallet',
      desc: '',
      args: [],
    );
  }

  /// `Add Money`
  String get add_money {
    return Intl.message(
      'Add Money',
      name: 'add_money',
      desc: '',
      args: [],
    );
  }

  /// `Recent Transactions`
  String get recent_transactions {
    return Intl.message(
      'Recent Transactions',
      name: 'recent_transactions',
      desc: '',
      args: [],
    );
  }

  /// `Joined on`
  String get joined_on {
    return Intl.message(
      'Joined on',
      name: 'joined_on',
      desc: '',
      args: [],
    );
  }

  /// `Activity`
  String get activity {
    return Intl.message(
      'Activity',
      name: 'activity',
      desc: '',
      args: [],
    );
  }

  /// `Invite`
  String get invite {
    return Intl.message(
      'Invite',
      name: 'invite',
      desc: '',
      args: [],
    );
  }

  /// `Invited`
  String get invited {
    return Intl.message(
      'Invited',
      name: 'invited',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'id'),
      Locale.fromSubtags(languageCode: 'it'),
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'sw'),
      Locale.fromSubtags(languageCode: 'tr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
