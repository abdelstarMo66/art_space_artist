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

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "forgetPassword":
            MessageLookupByLibrary.simpleMessage("Forget password?"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "noInternet": MessageLookupByLibrary.simpleMessage(
            "No internet connection found.\nPlease check your internet setting"),
        "onBoardingAppBarTitle": MessageLookupByLibrary.simpleMessage("Skip"),
        "onBoardingFirstScreenMain": MessageLookupByLibrary.simpleMessage(
            "Visit the exhibition and show suitable painting"),
        "onBoardingFirstScreenSecond": MessageLookupByLibrary.simpleMessage(
            "She want to get more details about insights about the painting"),
        "onBoardingSecScreenMain": MessageLookupByLibrary.simpleMessage(
            "Explore the exhibition at home "),
        "onBoardingSecScreenSecond": MessageLookupByLibrary.simpleMessage(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
        "onBoardingThirdScreenMain": MessageLookupByLibrary.simpleMessage(
            "The client buy suitable painting and put in the wall"),
        "onBoardingThirdScreenSecond": MessageLookupByLibrary.simpleMessage(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
        "password": MessageLookupByLibrary.simpleMessage("password"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "whoops": MessageLookupByLibrary.simpleMessage("Whoops")
      };
}