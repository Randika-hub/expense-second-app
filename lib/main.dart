import 'package:expenseapp/models/expence_model.dart';
import 'package:expenseapp/models/income_model.dart';
import 'package:expenseapp/server_income/encome_catogory.dart';
import 'package:expenseapp/servers/catogory_adapter.dart';
import 'package:expenseapp/user_services/user_services.dart';
import 'package:expenseapp/widgets/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();

  await Hive.initFlutter();

  //Expences store the phone storage
  Hive.registerAdapter(ExpenceModelAdapter());
  Hive.registerAdapter(CatogoryAdapter());
  await Hive.openBox("ExpenecDatabase");

  //Encome stor the phone storage
  Hive.registerAdapter(EncomeModelAdapter());
  Hive.registerAdapter(EncomeCatogoryAdepter());
  await Hive.openBox("EncomeDataBase");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserServices.ChekUserName(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          bool hasUserData = snapshot.data ?? false;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'test',
            home: Wrapper(showMainScreen: hasUserData),
          );
        }
      },
    );
  }
}
