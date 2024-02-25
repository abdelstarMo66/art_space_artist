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

  /// `Welcome back`
  String get welcomeBack {
    return Intl.message(
      'Welcome back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `sign in to access your account`
  String get loginMessage {
    return Intl.message(
      'sign in to access your account',
      name: 'loginMessage',
      desc: '',
      args: [],
    );
  }

  /// `LOGIN`
  String get login {
    return Intl.message(
      'LOGIN',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get email {
    return Intl.message(
      'Enter your email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get password {
    return Intl.message(
      'Enter your password',
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

  /// `Don't have an account ?`
  String get newMember {
    return Intl.message(
      'Don\'t have an account ?',
      name: 'newMember',
      desc: '',
      args: [],
    );
  }

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

  /// `Enter your name`
  String get name {
    return Intl.message(
      'Enter your name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get phone {
    return Intl.message(
      'Enter your phone number',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the email address associated with your account`
  String get forgetPasswordText {
    return Intl.message(
      'Please enter the email address associated with your account',
      name: 'forgetPasswordText',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
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

  /// `Verify Your Email`
  String get verifyYourEmail {
    return Intl.message(
      'Verify Your Email',
      name: 'verifyYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `A 4 digits code has been sent to your email address`
  String get verifyYourEmailText {
    return Intl.message(
      'A 4 digits code has been sent to your email address',
      name: 'verifyYourEmailText',
      desc: '',
      args: [],
    );
  }

  /// `Create New Password`
  String get createNewPassword {
    return Intl.message(
      'Create New Password',
      name: 'createNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `You New Password must different from previously password`
  String get createNewPasswordText {
    return Intl.message(
      'You New Password must different from previously password',
      name: 'createNewPasswordText',
      desc: '',
      args: [],
    );
  }

  /// `Enter new password`
  String get enterNewPassword {
    return Intl.message(
      'Enter new password',
      name: 'enterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm new password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm new password',
      name: 'confirmNewPassword',
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

  /// `if you didn't receive a code!`
  String get resendText {
    return Intl.message(
      'if you didn\'t receive a code!',
      name: 'resendText',
      desc: '',
      args: [],
    );
  }

  /// `ALL`
  String get all {
    return Intl.message(
      'ALL',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Available`
  String get available {
    return Intl.message(
      'Available',
      name: 'available',
      desc: '',
      args: [],
    );
  }

  /// `Sold`
  String get sold {
    return Intl.message(
      'Sold',
      name: 'sold',
      desc: '',
      args: [],
    );
  }

  /// `Your events`
  String get yourEvents {
    return Intl.message(
      'Your events',
      name: 'yourEvents',
      desc: '',
      args: [],
    );
  }

  /// `Your product`
  String get yourProduct {
    return Intl.message(
      'Your product',
      name: 'yourProduct',
      desc: '',
      args: [],
    );
  }

  /// `Welcome,`
  String get welcome {
    return Intl.message(
      'Welcome,',
      name: 'welcome',
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
