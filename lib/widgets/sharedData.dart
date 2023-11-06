import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartwash/constants.dart';

saveObject(String key, var value) async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  return sp.setString(key, value);
}

saveintObject(String key, var value) async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  return sp.setInt(key, value);
}

getSavedObject(String key) async {
  SharedPreferences sp = await SharedPreferences.getInstance();

  return sp.getString(key);
}

ShowToast(var message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.NONE,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blueGrey,
      textColor: Constants.blackColor,
      fontSize: 16.0);
}
