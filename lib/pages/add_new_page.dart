import 'package:expenseapp/const_things.dart';
import 'package:expenseapp/models/expence_model.dart';
import 'package:expenseapp/models/income_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNewPage extends StatefulWidget {
  const AddNewPage({super.key});

  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  //that income and expence toggle varible
  int _changeIncomeAndExpencePage = 0;

  //that enum save the default varible
  ExpenceCatogory defaulSelectCatogoryExpence = ExpenceCatogory.shopping;
  EncomeCatogory defaulSelectCatogoryEncome = EncomeCatogory.salary;

  //controller sets varible
  final TextEditingController topbigController = TextEditingController();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  //dispose add the textformFild for collect the garbage collection

  @override
  void dispose() {
    topbigController.dispose();
    titleController.dispose();
    descriptionController.dispose();
    amountController.dispose();
    super.dispose();
  }

  //Show date picker for varible
  DateTime _selectedDate = DateTime.now();

  final DateTime _initioalDate = DateTime.now();
  final DateTime _firstDate = DateTime(
    DateTime.now().year - 1,
    DateTime.now().month,
    DateTime.now().day,
  );

  final DateTime _lastDate = DateTime(
    DateTime.now().year + 1,
    DateTime.now().month,
    DateTime.now().day,
  );

  //select time with clock so create a varible for select time
  DateTime _selectedTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _changeIncomeAndExpencePage == 0
          ? Colors.red
          : Colors.green,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.09,
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
                                    'Encome',
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: const EdgeInsets.only(top: 80),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "How Much",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          TextField(
                            controller: topbigController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                            ),

                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "0",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 60,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //user Form Data
                  Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    margin: const EdgeInsets.only(top: 240),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Form(
                        child: Column(
                          children: [
                            DropdownButtonFormField(
                              //hint: const Text('Expence catogor'),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              items: _changeIncomeAndExpencePage == 0
                                  ? ExpenceCatogory.values.map((catogory) {
                                      return DropdownMenuItem(
                                        value: catogory,
                                        child: Text(catogory.name),
                                      );
                                    }).toList()
                                  : EncomeCatogory.values.map((encomeCatogory) {
                                      return DropdownMenuItem(
                                        value: encomeCatogory,
                                        child: Text(encomeCatogory.name),
                                      );
                                    }).toList(),
                              initialValue: _changeIncomeAndExpencePage == 0
                                  ? defaulSelectCatogoryExpence
                                  : defaulSelectCatogoryEncome,

                              onChanged: (value) {
                                setState(() {
                                  _changeIncomeAndExpencePage == 0
                                      ? defaulSelectCatogoryExpence =
                                            value as ExpenceCatogory
                                      : defaulSelectCatogoryEncome =
                                            value as EncomeCatogory;
                                });
                              },
                            ),
                            sizeSpacerHeight1,
                            TextFormField(
                              controller: titleController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                hintText: "title",
                                hintStyle: const TextStyle(color: Colors.black),
                                contentPadding: const EdgeInsets.all(15),
                              ),
                            ),

                            //description textForm feild
                            sizeSpacerHeight1,
                            TextFormField(
                              controller: descriptionController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                hintText: "description",
                                hintStyle: const TextStyle(color: Colors.black),
                                contentPadding: const EdgeInsets.all(15),
                              ),
                            ),

                            //Amount textform Field
                            sizeSpacerHeight1,
                            TextFormField(
                              controller: amountController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                hintText: "Amount",

                                hintStyle: const TextStyle(color: Colors.black),
                                contentPadding: const EdgeInsets.all(15),
                              ),
                            ),
                            sizeSpacerHeight1,

                            //Show date picker
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      showDatePicker(
                                        context: context,
                                        initialDate: _initioalDate,
                                        firstDate: _firstDate,
                                        lastDate: _lastDate,
                                      ).then((date) {
                                        if (date != null ||
                                            date != _selectedDate) {
                                          setState(() {
                                            _selectedDate = date!;
                                          });
                                        }
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.purple,
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 10,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.date_range_outlined,
                                              color: Colors.white,
                                            ),
                                            sizeSpacerWidth1,

                                            Text(
                                              "Selecte Date",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    DateFormat.yMMMd().format(_selectedDate),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 2),

                            //selet time watch
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      ).then((date) {
                                        if (date != null) {
                                          setState(() {
                                            _selectedTime = DateTime(
                                              _selectedTime.year,
                                              _selectedDate.month,
                                              _selectedTime.day,
                                              date.hour,
                                              date.minute,
                                            );
                                          });
                                        }
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.orange,
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 10,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.timer,
                                              color: Colors.white,
                                            ),
                                            sizeSpacerWidth1,

                                            Text(
                                              "Selecte Time",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(DateFormat.jm().format(_selectedTime)),
                                ],
                              ),
                            ),
                            sizeSpacerHeight1,
                            const Divider(color: Colors.grey, thickness: 3),
                            sizeSpacerHeight2,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: _changeIncomeAndExpencePage == 0
                                      ? Colors.red
                                      : Colors.green,
                                ),
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                                child: const Center(
                                  child: Text(
                                    'Add',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
