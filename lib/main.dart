import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calendar_zadach/%D0%B0uthentication/pages/splash_screen/splash_screen.dart';
import 'package:flutter_calendar_zadach/%D0%B0uthentication/pages/user_auth_pages/login_page.dart';
import 'package:flutter_calendar_zadach/%D0%B0uthentication/pages/user_auth_pages/sign_up_page.dart';
import 'package:flutter_calendar_zadach/firebase_options.dart';
import 'package:flutter_calendar_zadach/pages/bloc/calendar_bloc.dart';
import 'package:flutter_calendar_zadach/generated/l10n.dart';
import 'package:flutter_calendar_zadach/localizationsBloc/locale_bloc.dart';
import 'package:flutter_calendar_zadach/themeBloc/theme_bloc.dart';
import 'package:flutter_calendar_zadach/widgets/app_bar_widget.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  initializeDateFormatting("ar_SA", null);
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } else {
    await Firebase.initializeApp();
  }

  runApp(
    BlocProvider(
      create: (context) => ThemeBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocaleBloc(),
      child: BlocBuilder<LocaleBloc, LocaleState>(
        builder: (context, state) {
          return BlocBuilder<ThemeBloc, bool>(
            builder: (context, isLightTheme) {
              return MaterialApp(
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en', ''),
                  Locale('ru', ''),
                ],
                locale: state.locale, // Установка текущей локали
                debugShowCheckedModeBanner: false,
                title: 'Flutter Firebase',
                theme: isLightTheme ? ThemeData.light() : ThemeData.dark(),
                routes: {
                  '/': (context) => const SplashScreen(
                        child: LoginPage(),
                      ),
                  '/login': (context) => const LoginPage(),
                  '/signUp': (context) => const SignUpPage(),
                },
                onGenerateRoute: (routeSettings) {
                  var path = routeSettings.name!.split('/');
                  if (path[1] == "home") {
                    return MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => CalendarBloc(),
                        child: AppBarWidget(id: path[2]),
                      ),
                      settings: routeSettings,
                    );
                  }
                  return null;
                },
              );
            },
          );
        },
      ),
    );
  }
}
