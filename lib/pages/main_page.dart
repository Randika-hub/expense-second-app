import 'package:expenseapp/models/expence_model.dart';
import 'package:expenseapp/models/income_model.dart';
import 'package:expenseapp/pages/add_new_page.dart';
import 'package:expenseapp/pages/budget_page.dart';
import 'package:expenseapp/pages/home_page.dart';
import 'package:expenseapp/pages/profile_page.dart';
import 'package:expenseapp/pages/transection_page.dart';
import 'package:expenseapp/server_income/server/database.dart';
import 'package:expenseapp/servers/database.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentindex = 0;
  //final List<ExpenceModel> expenceList = [];
  //final List<EncomeModel> encomeList = [];

  // this is open the hive box expences
  final _mybox = Hive.box("ExpenecDatabase");
  Database db = Database(); //get the keis(methods) open the data base

  final _myboxEncome = Hive.box("EncomeDataBase");
  IncomeDatabase incomedb = IncomeDatabase();

  @override
  void initState() {
    super.initState();
    if (_mybox.get("ExpenceKey") == null) {
      db.createInitialDataBase();
    } else {
      db.loardDate();
    }

    if (_myboxEncome.get("dataEncome") == null) {
      incomedb.initialData();
    } else {
      incomedb.loardTheData();
    }
  }

  //for add the expences for list database
  void onGarrige(ExpenceModel car) {
    setState(() {
      db.expenceList.add(car);
    });
    db.updateTheData(context);
  }

  //for remove the expences frome list
  void removeExpence(ExpenceModel expence) {
    final currentExpenceIndex = db.expenceList.indexOf(expence);

    setState(() {
      db.expenceList.remove(expence);
    });
    db.updateTheData(context);

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Expence was deleted!"),
        action: SnackBarAction(
          label: "undo",
          onPressed: () {
            setState(() {
              db.expenceList.insert(currentExpenceIndex, expence);
            });
          },
        ),
      ),
    );
  }

  //for add the encome to list database
  void encomeGariige(EncomeModel income) {
    setState(() {
      incomedb.encomeList.add(income);
    });
    incomedb.updateTheData(context);
  }

  //for delete the income methods
  void encomeDelete(EncomeModel encome) {
    final currentIncomeIndex = incomedb.encomeList.indexOf(encome);

    setState(() {
      incomedb.encomeList.remove(encome);
    });
    incomedb.updateTheData(context);

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("encome was deleted!"),
        action: SnackBarAction(
          label: "undo",
          onPressed: () {
            setState(() {
              incomedb.encomeList.insert(currentIncomeIndex, encome);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomePage(),
      TransectionPage(
        expenceList: db.expenceList,
        encomeList: incomedb.encomeList,
        encomeDelete: encomeDelete,
        expenceDelete: removeExpence,
      ),
      AddNewPage(expenceAdd: onGarrige, encomeAdd: encomeGariige),
      const BudgetPage(),
      const ProfilePage(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,

        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white,

        selectedIconTheme: const IconThemeData(applyTextScaling: true),
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          const BottomNavigationBarItem(
            icon: Icon(Icons.list_rounded),
            label: "Transection",
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.purple,
                shape: BoxShape.circle,
              ),

              child: const Icon(Icons.add, size: 30, color: Colors.white),
            ),
            label: " ",
          ),

          const BottomNavigationBarItem(
            icon: Icon(Icons.rocket),
            label: "budget",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "profile",
          ),
        ],
      ),
      body: pages[_currentindex],
    );
  }
}
