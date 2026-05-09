import 'package:expenseapp/const_things.dart';
import 'package:expenseapp/customs/custom_appbar_container.dart';
import 'package:expenseapp/models/expence_model.dart';
import 'package:expenseapp/models/income_model.dart';
import 'package:expenseapp/user_services/user_services.dart';
import 'package:expenseapp/widgets/Expence_card.dart';
import 'package:expenseapp/widgets/encome_card.dart';
import 'package:expenseapp/widgets/linechart.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final List<ExpenceModel> expencList;
  final List<EncomeModel> encomeList;
  const HomePage({
    super.key,
    required this.expencList,
    required this.encomeList,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = "";
  double expenceTotal = 0;
  double encomeTotal = 0;

  @override
  void initState() {
    UserServices.getcarKey().then((manager) {
      if (manager["Name"] != null) {
        setState(() {
          userName = manager["Name"]!;
        });
      }
    });

    for (var i = 0; i < widget.expencList.length; i++) {
      expenceTotal += widget.expencList[i].expenceAmount;
    }

    for (var en = 0; en < widget.encomeList.length; en++) {
      encomeTotal += widget.encomeList[en].amount;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                              Expanded(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.notifications,
                                    // size: 30,
                                    color: Colors.pink,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          sizeSpacerHeight2,
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomAppbarContainer(
                                    amount: encomeTotal,
                                    containerBGColor: Colors.green,
                                    imagUrl: "assets/images/income.png",
                                    title: "Incomes",
                                  ),
                                  CustomAppbarContainer(
                                    amount: expenceTotal,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Spend Frequency",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.deepPurple,
                        ),
                      ),
                      sizeSpacerHeight1,
                      const Linechart(),
                      sizeSpacerHeight1,

                      const Text(
                        "Recent Expences",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      widget.expencList.isEmpty
                          ? const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                " if you add the expences for your expence list, you can see your expences this...",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.purpleAccent,
                                ),
                              ),
                            )
                          : ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: widget.expencList.length,
                              itemBuilder: (context, index) {
                                final expence = widget.expencList[index];
                                return ExpenceCard(
                                  expenceCatogory: expence.expenceCatogory,
                                  expenceTitle: expence.expenceTitle,
                                  expenceDescription:
                                      expence.expenceDescription,
                                  expenceAmount: expence.expenceAmount,
                                  expenceDate: expence.expenceDate,
                                  expenceTime: expence.expenceTime,
                                );
                              },
                            ),
                      sizeSpacerHeight2,
                      const Text(
                        "Recent Encomes",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      sizeSpacerHeight1,
                      widget.encomeList.isEmpty
                          ? const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                " if you add the encomes for your encome list, you can see your encomes this...",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.purpleAccent,
                                ),
                              ),
                            )
                          : ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: widget.encomeList.length,
                              itemBuilder: (context, index) {
                                final encome = widget.encomeList[index];
                                return EncomeCard(
                                  catogory: encome.catogory,
                                  title: encome.title,
                                  description: encome.description,
                                  amount: encome.amount,
                                  date: encome.date,
                                  time: encome.time,
                                );
                              },
                            ),
                    ],
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
