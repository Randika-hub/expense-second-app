import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  static Future<void> stortheUserData({
    required String userName,
    required String usermail,
    required String userpassword,
    required String userconfirmPassword,
    required BuildContext context,
  }) async {
    try {
      if (userpassword != userconfirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('your conform password is wrongly. retry'),
          ),
        );
        return;
      }
      //save the data logic

      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString('Name', userName);
      await pref.setString('Email', usermail);

      //display the scafforl massanger
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('save the data successfull email and name'),
        ),
      );
    } catch (error) {
      error.toString();
    }
  }

  static Future<bool> ChekUserName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    String? username = pref.getString('Name');
    return username != null;
  }
}
