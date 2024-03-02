import 'dart:async';
import 'package:art_space_artist/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/const_method.dart';
import 'core/di/dependency_injection.dart';
import 'core/global_bloc/bloc_observer.dart';
import 'core/helpers/cache_helper.dart';
import 'core/helpers/notification_service.dart';

Future<void> main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      Bloc.observer = MyBlocObserver();
      setupGetIt();
      await NotificationService.initialize();
      await CacheHelper.init();
      runApp(MyApp());
    },
    (error, stackTrace) async {
      logError("Global Error: $error");
      logError("Global StackTrace: $stackTrace");
    },
  );
}
