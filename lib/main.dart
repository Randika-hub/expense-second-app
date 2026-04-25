import 'package:expenseapp/on_bording_screens_full_files/screens/on_boarding_screens.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'expense',
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreens(),
    );
  }
}
