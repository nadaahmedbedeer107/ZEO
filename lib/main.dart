import 'package:flutter/material.dart';
import 'package:zeo/view/on_boarding/on_boarding_view.dart';
import 'package:zeo/view/on_boarding/startup_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZEO Helper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Metropolis",

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StartupView(),
      // home: const StartupView(),
    );
  }
}


