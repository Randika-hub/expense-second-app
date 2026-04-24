import 'package:flutter/material.dart';

class UserInputData extends StatefulWidget {
  const UserInputData({super.key});

  @override
  State<UserInputData> createState() => _UserInputDataState();
}

class _UserInputDataState extends State<UserInputData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('data')));
  }
}
