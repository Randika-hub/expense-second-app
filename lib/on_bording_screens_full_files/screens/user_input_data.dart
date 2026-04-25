import 'package:expenseapp/on_bording_screens_full_files/widgets/on_boarding_button.dart';
import 'package:expenseapp/pages/main_page.dart';
import 'package:expenseapp/user_services/user_services.dart';
import 'package:flutter/material.dart';

class UserInputData extends StatefulWidget {
  const UserInputData({super.key});

  @override
  State<UserInputData> createState() => _UserInputDataState();
}

class _UserInputDataState extends State<UserInputData> {
  //text editich controller
  final TextEditingController enterNametexteditingController =
      TextEditingController();
  final TextEditingController enterEmailtexteditingController =
      TextEditingController();
  final TextEditingController enterPasswardtexteditingController =
      TextEditingController();
  final TextEditingController enterConformPasswardtexteditingController =
      TextEditingController();

  // dispose use for textfield garbage collection

  @override
  void dispose() {
    super.dispose();
    enterNametexteditingController.dispose();
    enterEmailtexteditingController.dispose();
    enterPasswardtexteditingController.dispose();
    enterConformPasswardtexteditingController.dispose();
  }

  bool rememberme = false;

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text(
              "Enter your Personal Details",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            const SizedBox(height: 10),
            Form(
              key: _key,
              child: Column(
                children: [
                  TextFormField(
                    controller: enterNametexteditingController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'මචං උබ මේක දාලා නෑ ';
                      }
                      return null;
                    },
                    autocorrect: true,

                    cursorColor: Colors.lightBlueAccent,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),

                      hintText: 'Enter Name',
                      hintStyle: const TextStyle(color: Colors.black),
                    ),
                    selectAllOnFocus: true,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: enterEmailtexteditingController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'මචං උබ මේක දාලා නෑ ';
                      }
                      return null;
                    },
                    autocorrect: true,

                    cursorColor: Colors.lightBlueAccent,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),

                      hintText: ' enter email',
                      hintStyle: const TextStyle(color: Colors.black),
                    ),
                    selectAllOnFocus: true,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: enterPasswardtexteditingController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'මචං උබ මේක දාලා නෑ ';
                      }
                      return null;
                    },
                    obscureText: true,
                    autocorrect: true,

                    cursorColor: Colors.lightBlueAccent,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),

                      hintText: ' enter password',
                      hintStyle: const TextStyle(color: Colors.black),
                    ),
                    selectAllOnFocus: true,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: enterConformPasswardtexteditingController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'මචං උබ මේක දාලා නෑ ';
                      }
                      return null;
                    },
                    obscureText: true,
                    autocorrect: true,

                    cursorColor: Colors.lightBlueAccent,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),

                      hintText: ' enter confirmPassword',
                      hintStyle: const TextStyle(color: Colors.black),
                    ),
                    selectAllOnFocus: true,
                  ),
                  const SizedBox(height: 20),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const Text(
                  //       'Remember Me for the next time',
                  //       style: TextStyle(
                  //         fontSize: 20,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  CheckboxListTile(
                    title: const Text('Remember Me for the next time'),
                    value: rememberme,
                    onChanged: (newvalue) {
                      setState(() {
                        rememberme = newvalue!;
                      });
                    },
                  ),

                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () async {
                      if (_key.currentState!.validate()) {
                        String userName = enterNametexteditingController.text;
                        String userEmail = enterEmailtexteditingController.text;
                        String userPassword =
                            enterPasswardtexteditingController.text;
                        String userConfirmPassword =
                            enterConformPasswardtexteditingController.text;

                        await UserServices.stortheUserData(
                          userName: userName,
                          usermail: userEmail,
                          userpassword: userPassword,
                          userconfirmPassword: userConfirmPassword,
                          context: context,
                        );
                        if (context.mounted) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainPage(),
                            ),
                          );
                        }
                      }
                    },
                    child: const OnBoardingButton(
                      buttonColor: Colors.purple,
                      buttonName: 'Next',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
