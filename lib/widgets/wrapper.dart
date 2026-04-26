import 'package:expenseapp/on_bording_screens_full_files/screens/on_boarding_screens.dart';
import 'package:expenseapp/pages/main_page.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  final bool showMainScreen;
  const Wrapper({super.key, required this.showMainScreen});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return widget.showMainScreen ? const MainPage() : const OnBoardingScreens();
  }
}
