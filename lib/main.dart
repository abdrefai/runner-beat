import 'package:flutter/material.dart';
import 'package:runner_beat/pages/home.dart';
import 'package:runner_beat/pages/onBoarding.dart';
import 'package:shared_preferences/shared_preferences.dart';



 int ?initScreen;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = await preferences.getInt("initScreen");
  await preferences.setInt("initScreen", 1);
  runApp(const MyApp());
}
loadFromFuture() async {
  await Future.delayed(Duration(seconds: 5));
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

      initialRoute: initScreen ==0 || initScreen == null ? 'onboard':"home",
      routes: {
        'home':(context) => home(),
        'onboard':(context) =>  OnBoarding(),
    },
      );

  }
}
