import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:smartwash/models/loginModel.dart';
import 'package:smartwash/screens/home_page.dart';
import 'package:smartwash/widgets/sharedData.dart';

class LoginController extends GetxController {
  var url = "https://smartwashvklm.com/api/list_api/login";
  Dio dio = Dio();
  Login? loginModel;
  RxBool isLoading = false.obs;

  loginUser(Map data) async {
    isLoading(true);
    try {
      FormData formData = FormData.fromMap({
        "phone": data["phone"],
        "password": data["password"],
        "device_id": data["device_id"]
      });

      Response response = await dio.post(url, data: formData);
      print("result ${response.data}");
      if (response.statusCode == 200) {
        loginModel = Login.fromJson(jsonDecode(response.data));

        print(loginModel!.userDetails!.phoneNumber);
        print(loginModel!.userDetails!.email);
        print(loginModel!.userDetails!.id);
        print(loginModel!.userDetails!.fullname);
        print(loginModel!.userDetails!.image);
        print(loginModel!.userDetails!.profileComplete);
        print(loginModel!.userDetails!.randomPassword);
        print(loginModel!.userDetails!.staffStatus);
        saveObject("phone", loginModel!.userDetails!.phoneNumber);

        var name = await getSavedObject("uname");
        isLoading(false);
        ShowToast(loginModel!.message.toString());
        await Get.to(Home());
        return loginModel;
      } else {
        isLoading(false);
        ShowToast(response.data["message"].toString());
      }
    } catch (e) {
      ShowToast(loginModel!.message.toString());
      throw Exception(e);
    }
  }
}
