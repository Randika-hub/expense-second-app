import 'package:flutter/material.dart';

class OnBoardingButton extends StatelessWidget {
  final Color buttonColor;
  final String buttonName;
  const OnBoardingButton({
    super.key,
    required this.buttonColor,
    required this.buttonName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: buttonColor,
      ),
      child: Center(
        child: Text(
          buttonName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
