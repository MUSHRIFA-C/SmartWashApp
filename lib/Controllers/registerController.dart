import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:smartwash/models/registerModel.dart';
import 'package:smartwash/screens/login.dart';
import 'package:smartwash/widgets/sharedData.dart';


class RegisterController extends GetxController {
  var url = "https://smartwashvklm.com/api/list_api/register";
  Dio dio = Dio();
  Register? registerModel;
  RxBool isLoading = false.obs;

  registerUser(Map data) async {
    isLoading(true);
    try {
      FormData formData = FormData.fromMap({
        "email": data["email"],
        "fullname": data["fullname"],
        "password": data["password"],
        "deviceId": data["deviceId"],
        "phone": data["phone"]
      });
      print(data);
      Response response = await dio.post(url, data: formData);

      if (response.statusCode == 200) {
        isLoading(false);
        print(response.data);

        registerModel = Register.fromJson(jsonDecode(response.data));

        if (registerModel != null && registerModel!.userDetails != null) {
          saveObject("useremail", registerModel!.userDetails!.email);
          saveObject("uname", registerModel!.userDetails!.userName);
          var name = await getSavedObject("uname");
        } else {
          ShowToast("Registration failed. Please check your data.");
        }

        ShowToast(registerModel!.message);
        Get.to(LoginPage());
        return registerModel;
      } else {
        ShowToast(response.data["message"]);
      }
    } catch (e) {
      ShowToast("Error during registration: $e");
      throw Exception(e);
    }
  }
}
