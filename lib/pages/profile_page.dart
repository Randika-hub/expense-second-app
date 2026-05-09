import 'package:expenseapp/const_things.dart';
import 'package:expenseapp/on_bording_screens_full_files/screens/on_boarding_screens.dart';
import 'package:expenseapp/server_income/server/database.dart';
import 'package:expenseapp/servers/database.dart';
import 'package:expenseapp/user_services/user_services.dart';
import 'package:expenseapp/widgets/profile_card.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void openBottomSheet() {
    showModalBottomSheet(
      context: context,

      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Colors.white,
          ),

          child: Column(
            children: [
              sizeSpacerHeight1,
              const Text(
                "log out?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              sizeSpacerHeight2,
              const Text(
                "Are you sure do you wanna logout?",
                style: TextStyle(color: Colors.grey, fontSize: 17),
              ),
              sizeSpacerHeight3,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 150,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.purple.shade100,
                      ),

                      child: const Center(
                        child: Text("No", style: TextStyle(fontSize: 25)),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await UserServices.removeUserData();
                      if (context.mounted) {
                        await Database().removeExpencesaHiveDataBase(context);
                      }

                      if (context.mounted) {
                        await IncomeDatabase().removeEncomesaHiveDataBase(
                          context,
                        );
                      }
                      if (context.mounted) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OnBoardingScreens(),
                          ),
                          (route) => false,
                        );
                      }
                    },
                    child: Container(
                      width: 150,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.purple,
                      ),

                      child: const Center(
                        child: Text(
                          "yes",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  String userName = '';
  String userEmail = '';

  @override
  void initState() {
    UserServices.getcarKey().then((manager) {
      if (manager["Name"] != null) {
        setState(() {
          userName = manager["Name"]!;
          userEmail = manager["Email"]!;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),

                        border: Border.all(color: Colors.pink),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(100),
                        child: Image.asset(
                          "assets/images/user.jpg",
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                      ),
                    ),
                    sizeSpacerWidth2,
                    Text(
                      'Welcom $userName',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    sizeSpacerWidth2,
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                          //size: 30,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                sizeSpacerHeight3,
                Text(
                  'Welcom $userEmail',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                sizeSpacerHeight1,
                const ProfileCard(
                  icon: Icons.wallet,
                  title: "My Wallet",
                  color: Colors.pink,
                ),
                const ProfileCard(
                  icon: Icons.settings,
                  title: "Settings",
                  color: Colors.blue,
                ),
                const ProfileCard(
                  icon: Icons.download,
                  title: "Export Data",
                  color: Colors.green,
                ),
                GestureDetector(
                  onTap: () {
                    openBottomSheet();
                  },
                  child: const ProfileCard(
                    icon: Icons.logout,
                    title: "log out",
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
