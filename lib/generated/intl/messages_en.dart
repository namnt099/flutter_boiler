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
        "appName": MessageLookupByLibrary.simpleMessage("Base App"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "dontHaveAccount":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account?"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailHint": MessageLookupByLibrary.simpleMessage("Enter your email"),
        "error": MessageLookupByLibrary.simpleMessage("Error"),
        "errorEmailInUse":
            MessageLookupByLibrary.simpleMessage("Email is already in use"),
        "errorInvalidEmail":
            MessageLookupByLibrary.simpleMessage("Invalid email address"),
        "errorInvalidPassword":
            MessageLookupByLibrary.simpleMessage("Invalid password"),
        "errorOperationNotAllowed":
            MessageLookupByLibrary.simpleMessage("Operation not allowed"),
        "errorServer": MessageLookupByLibrary.simpleMessage(
            "An unexpected error occurred"),
        "errorUserDisabled":
            MessageLookupByLibrary.simpleMessage("This user has been disabled"),
        "errorUserNotFound":
            MessageLookupByLibrary.simpleMessage("User not found"),
        "errorWeakPassword":
            MessageLookupByLibrary.simpleMessage("Password is too weak"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot Password?"),
        "loading": MessageLookupByLibrary.simpleMessage("Loading..."),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordHint":
            MessageLookupByLibrary.simpleMessage("Enter your password"),
        "retry": MessageLookupByLibrary.simpleMessage("Retry"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "success": MessageLookupByLibrary.simpleMessage("Success"),
        "successLogin":
            MessageLookupByLibrary.simpleMessage("Login successful"),
        "successLogout":
            MessageLookupByLibrary.simpleMessage("Logout successful"),
        "welcome": MessageLookupByLibrary.simpleMessage("Welcome")
      };
}
