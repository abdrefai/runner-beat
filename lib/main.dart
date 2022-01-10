import 'package:flutter/material.dart';
import 'package:runner_beat/pages/onBoarding.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(const MyApp());
}
loadFromFuture() async {
  await Future.delayed(Duration(seconds: 7));
  bool isLogged = true;
  if (isLogged) {
    return OnBoarding();

  }
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   int height = 500;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SplashScreen(
        title: const Text(
          'Welcome to kafu Box ',
          style: TextStyle(
              fontSize: 18,
              color: Colors.white
          ),
        ),
        image:  Image.asset('assets/images/logo.png'),

        photoSize: 150.0,

        backgroundColor: Color.fromRGBO(39, 36, 53, 1),
        loaderColor: Color.fromRGBO(3, 152, 158, 1),
        navigateAfterFuture: loadFromFuture(),
      )
      );

  }
}
