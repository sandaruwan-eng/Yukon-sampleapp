import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/home_screen.dart';
import 'screens/sign_in_screen.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(1440, 2880),
      builder: () {
        return const MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SignInMain(),
        '/home_screen': (context) => HomePage(),
      },
    );
  }
}
