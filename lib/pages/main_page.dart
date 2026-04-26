import 'package:expenseapp/pages/add_new_page.dart';
import 'package:expenseapp/pages/budget_page.dart';
import 'package:expenseapp/pages/home_page.dart';
import 'package:expenseapp/pages/profile_page.dart';
import 'package:expenseapp/pages/transection_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentindex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const TransectionPage(),
    const AddNewPage(),
    const BudgetPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        onTap: (index) {
          setState(() {
            _currentindex = index;
            print(_currentindex);
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
      body: _pages[_currentindex],
    );
  }
}
