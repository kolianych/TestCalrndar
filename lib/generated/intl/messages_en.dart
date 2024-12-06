// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(e) => "An error occurred: ${e}";

  static String m1(state) => "Error: ${state}";

  static String m2(selectedTime) => "Select time: ${selectedTime}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addEvent": MessageLookupByLibrary.simpleMessage("Add Event"),
        "all": MessageLookupByLibrary.simpleMessage("All"),
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "anErrorOccurredE": m0,
        "areYouSureYouWantToDelete": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to delete?"),
        "attentionDialog": MessageLookupByLibrary.simpleMessage("Attention!"),
        "backDialog": MessageLookupByLibrary.simpleMessage("Back"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cybpeApp": MessageLookupByLibrary.simpleMessage("Events app"),
        "days": MessageLookupByLibrary.simpleMessage("days"),
        "deleteEvent": MessageLookupByLibrary.simpleMessage("Delete event"),
        "description": MessageLookupByLibrary.simpleMessage("Description"),
        "done": MessageLookupByLibrary.simpleMessage("Done?"),
        "dontHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account?"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "enterEventTitle":
            MessageLookupByLibrary.simpleMessage("Enter event title"),
        "errorState": m1,
        "events": MessageLookupByLibrary.simpleMessage("Events"),
        "eventsCalendar":
            MessageLookupByLibrary.simpleMessage("Events calendar"),
        "hours": MessageLookupByLibrary.simpleMessage("hours"),
        "invalidEmailOrPassword":
            MessageLookupByLibrary.simpleMessage("Invalid email or password."),
        "listOfEvents": MessageLookupByLibrary.simpleMessage("List of events"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "minutes": MessageLookupByLibrary.simpleMessage("minutes"),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "remindFor": MessageLookupByLibrary.simpleMessage("Remind for:"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "selectedtime": m2,
        "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "signup": MessageLookupByLibrary.simpleMessage("SignUp"),
        "someErrorHappend":
            MessageLookupByLibrary.simpleMessage("Some error happend"),
        "someErrorOccured":
            MessageLookupByLibrary.simpleMessage("some error occured"),
        "textDialog": MessageLookupByLibrary.simpleMessage(
            "You are trying to set a date that has already passed, or the current date and time as a scheduled date. Enter a valid date."),
        "theEmailAddressIsAlreadyInUse": MessageLookupByLibrary.simpleMessage(
            "The email address is already in use."),
        "thereAreNoEventsForThisDay": MessageLookupByLibrary.simpleMessage(
            "There are no events for this day."),
        "thereAreNoEventsToDisplay": MessageLookupByLibrary.simpleMessage(
            "There are no events to display."),
        "title": MessageLookupByLibrary.simpleMessage("Title"),
        "turnOnNotificationsInTheApp": MessageLookupByLibrary.simpleMessage(
            "Turn on notifications in the app!"),
        "userIsSuccessfullyCreated": MessageLookupByLibrary.simpleMessage(
            "User is successfully created"),
        "userIsSuccessfullySignedIn": MessageLookupByLibrary.simpleMessage(
            "User is successfully signed in"),
        "username": MessageLookupByLibrary.simpleMessage("Username"),
        "yes": MessageLookupByLibrary.simpleMessage("Yes")
      };
}
