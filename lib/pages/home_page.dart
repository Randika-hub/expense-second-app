import 'package:expenseapp/const_things.dart';
import 'package:expenseapp/customs/custom_appbar_container.dart';
import 'package:expenseapp/user_services/user_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = "";

  @override
  void initState() {
    UserServices.getcarKey().then((manager) {
      if (manager["Name"] != null) {
        setState(() {
          userName = manager["Name"]!;
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
            padding: const EdgeInsets.all(8.0),
            //main column
            child: Column(
              children: [
                //sub bg color Column
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,

                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      color: Colors.purple.shade100,
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),

                                  border: Border.all(color: Colors.pink),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    100,
                                  ),
                                  child: Image.asset(
                                    "assets/images/user.jpg",
                                    fit: BoxFit.cover,
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
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
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.notifications,
                                  size: 30,
                                  color: Colors.pink,
                                ),
                              ),
                            ],
                          ),
                          sizeSpacerHeight2,
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomAppbarContainer(
                                    amount: 20,
                                    containerBGColor: Colors.green,
                                    imagUrl: "assets/images/income.png",
                                    title: "Incomes",
                                  ),
                                  CustomAppbarContainer(
                                    amount: 2500,
                                    containerBGColor: Colors.red,
                                    imagUrl: "assets/images/expense.png",
                                    title: "Expences",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                sizeSpacerHeight1,
                const Text("data"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
