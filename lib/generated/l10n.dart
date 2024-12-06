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

  /// `Events app`
  String get cybpeApp {
    return Intl.message(
      'Events app',
      name: 'cybpeApp',
      desc: '',
      args: [],
    );
  }

  /// `Add Event`
  String get addEvent {
    return Intl.message(
      'Add Event',
      name: 'addEvent',
      desc: '',
      args: [],
    );
  }

  /// `Select time: {selectedTime}`
  String selectedtime(Object selectedTime) {
    return Intl.message(
      'Select time: $selectedTime',
      name: 'selectedtime',
      desc: '',
      args: [selectedTime],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
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

  /// `Remind for:`
  String get remindFor {
    return Intl.message(
      'Remind for:',
      name: 'remindFor',
      desc: '',
      args: [],
    );
  }

  /// `minutes`
  String get minutes {
    return Intl.message(
      'minutes',
      name: 'minutes',
      desc: '',
      args: [],
    );
  }

  /// `hours`
  String get hours {
    return Intl.message(
      'hours',
      name: 'hours',
      desc: '',
      args: [],
    );
  }

  /// `days`
  String get days {
    return Intl.message(
      'days',
      name: 'days',
      desc: '',
      args: [],
    );
  }

  /// `Attention!`
  String get attentionDialog {
    return Intl.message(
      'Attention!',
      name: 'attentionDialog',
      desc: '',
      args: [],
    );
  }

  /// `You are trying to set a date that has already passed, or the current date and time as a scheduled date. Enter a valid date.`
  String get textDialog {
    return Intl.message(
      'You are trying to set a date that has already passed, or the current date and time as a scheduled date. Enter a valid date.',
      name: 'textDialog',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get backDialog {
    return Intl.message(
      'Back',
      name: 'backDialog',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Done?`
  String get done {
    return Intl.message(
      'Done?',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Events`
  String get events {
    return Intl.message(
      'Events',
      name: 'events',
      desc: '',
      args: [],
    );
  }

  /// `Delete event`
  String get deleteEvent {
    return Intl.message(
      'Delete event',
      name: 'deleteEvent',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete?`
  String get areYouSureYouWantToDelete {
    return Intl.message(
      'Are you sure you want to delete?',
      name: 'areYouSureYouWantToDelete',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `There are no events to display.`
  String get thereAreNoEventsToDisplay {
    return Intl.message(
      'There are no events to display.',
      name: 'thereAreNoEventsToDisplay',
      desc: '',
      args: [],
    );
  }

  /// `Error: {state}`
  String errorState(Object state) {
    return Intl.message(
      'Error: $state',
      name: 'errorState',
      desc: '',
      args: [state],
    );
  }

  /// `There are no events for this day.`
  String get thereAreNoEventsForThisDay {
    return Intl.message(
      'There are no events for this day.',
      name: 'thereAreNoEventsForThisDay',
      desc: '',
      args: [],
    );
  }

  /// `Events calendar`
  String get eventsCalendar {
    return Intl.message(
      'Events calendar',
      name: 'eventsCalendar',
      desc: '',
      args: [],
    );
  }

  /// `List of events`
  String get listOfEvents {
    return Intl.message(
      'List of events',
      name: 'listOfEvents',
      desc: '',
      args: [],
    );
  }

  /// `Turn on notifications in the app!`
  String get turnOnNotificationsInTheApp {
    return Intl.message(
      'Turn on notifications in the app!',
      name: 'turnOnNotificationsInTheApp',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `User is successfully signed in`
  String get userIsSuccessfullySignedIn {
    return Intl.message(
      'User is successfully signed in',
      name: 'userIsSuccessfullySignedIn',
      desc: '',
      args: [],
    );
  }

  /// `some error occured`
  String get someErrorOccured {
    return Intl.message(
      'some error occured',
      name: 'someErrorOccured',
      desc: '',
      args: [],
    );
  }

  /// `SignUp`
  String get signup {
    return Intl.message(
      'SignUp',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `User is successfully created`
  String get userIsSuccessfullyCreated {
    return Intl.message(
      'User is successfully created',
      name: 'userIsSuccessfullyCreated',
      desc: '',
      args: [],
    );
  }

  /// `Some error happend`
  String get someErrorHappend {
    return Intl.message(
      'Some error happend',
      name: 'someErrorHappend',
      desc: '',
      args: [],
    );
  }

  /// `The email address is already in use.`
  String get theEmailAddressIsAlreadyInUse {
    return Intl.message(
      'The email address is already in use.',
      name: 'theEmailAddressIsAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred: {e}`
  String anErrorOccurredE(Object e) {
    return Intl.message(
      'An error occurred: $e',
      name: 'anErrorOccurredE',
      desc: '',
      args: [e],
    );
  }

  /// `Invalid email or password.`
  String get invalidEmailOrPassword {
    return Intl.message(
      'Invalid email or password.',
      name: 'invalidEmailOrPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter event title`
  String get enterEventTitle {
    return Intl.message(
      'Enter event title',
      name: 'enterEventTitle',
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
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
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
