import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rent_your_car/core/utils/binding.dart';
import 'package:rent_your_car/view/screens/auth/login_screen.dart';
import 'package:rent_your_car/view/screens/lunch_screen.dart';
import 'package:rent_your_car/view/styles/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context) => GetMaterialApp(
        initialBinding: Binding(),
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ar')],
        locale: const Locale('ar'),
        theme: theme,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const LunchScreen(),
          '/login': (context) =>  LoginScreen(),
        },
      ),
      designSize: const Size(375, 812),
    );
  }
}
