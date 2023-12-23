import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../core/constants/internet_connection.dart';
import '../core/constants/themes_manager.dart';
import '../core/global_bloc/app_cubit/app_cubit.dart';
import '../core/global_bloc/app_cubit/app_state.dart';
import '../core/router/app_router.dart';
import '../generated/l10n.dart';

class MyApp extends StatefulWidget {
  // named constructor
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lostConnection();
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()..initAppCubit(),
        ),
      ],
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          final cubit = AppCubit.get(context);
          return StreamBuilder<ConnectivityResult>(
              stream: Connectivity().onConnectivityChanged,
              builder: (context, snapshot) {
                if(snapshot.data == ConnectivityResult.none)
                  {
                    return const LostConnection();
                  }
                else{
                  return MaterialApp(
                    title: "Art Space",
                    onGenerateRoute: AppRouter.onGenerateRoutes,
                    debugShowCheckedModeBanner: false,
                    locale: cubit.locale,
                    localizationsDelegates: const [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: S.delegate.supportedLocales,
                    themeMode: cubit.themeMode,
                    theme: ThemesManager.lightTheme,
                    darkTheme: ThemesManager.darkTheme,
                  );
                }
              },
          );


        },
      ),
    );
  }
}
