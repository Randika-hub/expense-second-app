import 'package:flutter/material.dart';

class AddNewPage extends StatefulWidget {
  const AddNewPage({super.key});

  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  int _changeIncomeAndExpencePage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _changeIncomeAndExpencePage == 0
          ? Colors.red
          : Colors.green,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _changeIncomeAndExpencePage = 0;
                                  });
                                },
                                child: Container(
                                  width: 170,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: _changeIncomeAndExpencePage == 0
                                        ? Colors.red
                                        : Colors.white,
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),

                                    child: Center(
                                      child: Text(
                                        'Income',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _changeIncomeAndExpencePage = 1;
                                  });
                                },
                                child: Container(
                                  width: 170,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: _changeIncomeAndExpencePage == 1
                                        ? Colors.green
                                        : Colors.white,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Expence',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
