import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:smartwash/Controllers/registerController.dart';
import 'package:smartwash/constants.dart';
import 'package:smartwash/screens/login.dart';
import 'package:smartwash/widgets/custom_text.dart';
import 'package:smartwash/widgets/sharedData.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final fullnameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();


  final RegisterController registerController = Get.put(RegisterController());

  postData() async {
    var did = await getSavedObject("did");
    Map data = {
      "email": emailController.text.toString(),
      "fullname": fullnameController.text.toString(),
      "password": passwordController.text.toString(),
      "deviceId": did.toString(),
      "phone":phoneController.text.toString()
    };
    registerController.registerUser(data);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create Your \n Account',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextfield(
                obscureText: false,
                hintText: 'Enter Full name',
                icon: Icons.person,
                controller: fullnameController,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextfield(
                obscureText: false,
                hintText: 'Enter Email',
                icon: Icons.alternate_email,
                controller: emailController,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextfield(
                obscureText: false,
                hintText: 'Enter Phone',
                icon: Icons.phone,
                controller: phoneController,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextfield(
                obscureText: true,
                hintText: 'Enter Password',
                icon: Icons.remove_red_eye,
                controller: passwordController,
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {
                  await postData();
                },
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('OR'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: () {
                  Get.to(const LoginPage());
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'Have an Account? ',
                        style: TextStyle(
                          color: Constants.blackColor,
                        ),
                      ),
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: Constants.primaryColor,
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

