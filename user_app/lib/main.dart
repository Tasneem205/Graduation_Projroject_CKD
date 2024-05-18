import 'package:flutter/material.dart';
import 'package:user_app/Classes/language_constants.dart';
import 'package:user_app/module/exercise-screen.dart';
import 'package:user_app/pages/Diabetes.dart';
import 'package:user_app/pages/Edit%20Profile.dart';
import 'package:user_app/pages/Notifications.dart';
import 'package:user_app/pages/Pressure.dart';
import 'package:user_app/pages/Walking.dart';
import 'package:user_app/pages/hist.dart';
import 'package:user_app/pages/home.dart';
import 'package:user_app/pages/login.dart';
import 'package:user_app/pages/logo.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:user_app/pages/medicine.dart';
import 'package:user_app/pages/profile.dart';
import 'package:user_app/pages/water.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => MyAppState();
  static void setLocale(BuildContext context, Locale newLocale) {
    MyAppState? state = context.findAncestorStateOfType<MyAppState>();
    state?.setLocale(newLocale);
  }
}

class MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      initialRoute: '/',
      routes: {
        '/': (context) => const Logo(),
        '/login': (context) => const Login(),
        '/home': (context) => const Home(),
        '/water': (context) => const Water(),
        '/Pressure': (context) => const Pressure(),
        '/Diabetes': (context) => const Diabetes(),
        '/Walking': (context) => const Walking(),
        '/medicine': (context) => const Medicine(),
        '/profile': (context) => const Profile(),
        '/Edie Profile': (context) => const EditProfile(),
        '/Notifications': (context) => const Notifications(),
        '/Hist': (context) => const Hist(),
        '/ExerciseScreen': (context) => const ExerciseScreen(),
      },
    );
  }
}
