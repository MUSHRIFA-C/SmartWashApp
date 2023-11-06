import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:smartwash/Controllers/allserviceController.dart';
import 'package:smartwash/Controllers/vehicleController.dart';
import 'package:smartwash/constants.dart';

class AllVehicleType extends StatefulWidget {
  const AllVehicleType({super.key});

  @override
  State<AllVehicleType> createState() => _AllVehicleTypeState();
}

class _AllVehicleTypeState extends State<AllVehicleType> {

  ServiceController allServiceType = Get.put(ServiceController());
  VehicleController vehicleController = Get.put(VehicleController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        backgroundColor: Constants.primaryColor,
        title: const Text(
          "Vehicle Details",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Constants.primaryColor2,
      body: ListView.builder(
        itemCount: vehicleController.vehicleModel?.vehicleTypes?.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: size.width,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "ID : ${vehicleController.vehicleModel!.vehicleTypes![index].id ?? 1}",
                          style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Vehicle Type : ${vehicleController.vehicleModel!.vehicleTypes![index].vehicleType ?? 1}",
                          style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Details : ${vehicleController.vehicleModel!.vehicleTypes![index].allDetails ?? 1}",
                          style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
