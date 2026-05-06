import 'package:expenseapp/models/income_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class IncomeDatabase {
  final _myboxEncome = Hive.box("EncomeDataBase"); // මේක මං දන්නෙත් නෑ

  List<EncomeModel> encomeList = [];

  //initial data when open the app
  void initialData() {
    encomeList = [
      EncomeModel(
        title: 'app',
        description: "develop the app",
        date: DateTime.now(),
        time: DateTime.now(),
        amount: 1500,
        catogory: EncomeCatogory.other,
      ),
    ];
  }

  //Lorad the data
  Future<void> loardTheData() async {
    final data = await _myboxEncome.get("dataEncome");

    if (data != null && data is List<dynamic>) {
      //මේක මං දන්නෑ
      encomeList = data.cast<EncomeModel>().toList(); // මේක තේරෙන්නෙත් නෑ.
    }
  }

  //update the data
  Future<void> updateTheData(BuildContext context) async {
    await _myboxEncome.put("dataEncome", encomeList);

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("save your income in data base")),
      );
    }
  }
}
