import 'package:algo_project/ui/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Barsis game',
      home: WelcomePage(),
      locale: Locale('ar'),
      themeMode: ThemeMode.dark,
    );
  }
}
