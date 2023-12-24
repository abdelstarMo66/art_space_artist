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

  /// `Skip`
  String get onBoardingAppBarTitle {
    return Intl.message(
      'Skip',
      name: 'onBoardingAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Visit the exhibition and show suitable painting`
  String get onBoardingFirstScreenMain {
    return Intl.message(
      'Visit the exhibition and show suitable painting',
      name: 'onBoardingFirstScreenMain',
      desc: '',
      args: [],
    );
  }

  /// `She want to get more details about insights about the painting`
  String get onBoardingFirstScreenSecond {
    return Intl.message(
      'She want to get more details about insights about the painting',
      name: 'onBoardingFirstScreenSecond',
      desc: '',
      args: [],
    );
  }

  /// `Explore the exhibition at home `
  String get onBoardingSecScreenMain {
    return Intl.message(
      'Explore the exhibition at home ',
      name: 'onBoardingSecScreenMain',
      desc: '',
      args: [],
    );
  }

  /// `Lorem Ipsum is simply dummy text of the printing and typesetting industry.`
  String get onBoardingSecScreenSecond {
    return Intl.message(
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      name: 'onBoardingSecScreenSecond',
      desc: '',
      args: [],
    );
  }

  /// `The client buy suitable painting and put in the wall`
  String get onBoardingThirdScreenMain {
    return Intl.message(
      'The client buy suitable painting and put in the wall',
      name: 'onBoardingThirdScreenMain',
      desc: '',
      args: [],
    );
  }

  /// `Lorem Ipsum is simply dummy text of the printing and typesetting industry.`
  String get onBoardingThirdScreenSecond {
    return Intl.message(
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      name: 'onBoardingThirdScreenSecond',
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

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forget password?`
  String get forgetPassword {
    return Intl.message(
      'Forget password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'don/\'tHaveAccount' key

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Whoops`
  String get whoops {
    return Intl.message(
      'Whoops',
      name: 'whoops',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection found.\nPlease check your internet setting`
  String get noInternet {
    return Intl.message(
      'No internet connection found.\nPlease check your internet setting',
      name: 'noInternet',
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
