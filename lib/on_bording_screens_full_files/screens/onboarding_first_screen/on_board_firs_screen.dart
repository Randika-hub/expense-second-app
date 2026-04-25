import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  final String imagerul;
  final String name;
  final String subname;
  const OnboardingScreen({
    super.key,
    required this.imagerul,
    required this.name,
    required this.subname,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagerul, fit: BoxFit.cover, width: 250),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              name,

              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 39,
              ),
            ),
          ),

          Text(
            name,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
