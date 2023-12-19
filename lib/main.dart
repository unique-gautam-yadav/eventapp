import 'package:events_app/src/utils.dart';
import 'package:flutter/material.dart';

import 'src/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.pinkColor,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
