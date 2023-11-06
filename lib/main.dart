import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:smartwash/Controllers/allserviceController.dart';
import 'package:smartwash/Controllers/vehicleController.dart';
import 'package:smartwash/screens/allservice_types.dart';
import 'package:smartwash/screens/home_page.dart';
import 'package:smartwash/screens/welcome_screen.dart';

void main() {
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'SmartWash App',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  ServiceController allServiceType = Get.put(ServiceController());
  VehicleController vehicleController = Get.put(VehicleController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: WelcomeScreen(),
    );
  }
}
