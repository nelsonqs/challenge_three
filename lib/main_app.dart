import 'package:flutter/material.dart';

import 'bottom_nav_bar_screen.dart';
import 'data_tables_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BottomNavBarScreen(),
      routes: {
        '1': (context) => DataTablesScreen(),
      },
    );
  }
}
