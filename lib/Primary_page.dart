

import 'package:flutter/material.dart';
import 'package:inventory_management/colorfile.dart';
import 'package:action_slider/action_slider.dart';

class primary_page extends StatefulWidget {
  const primary_page({Key? key}) : super(key: key);

  @override
  State<primary_page> createState() => _Primary_pageState();
}

class _Primary_pageState extends State<primary_page> {
   call_login(){
    Navigator.pushNamed(context, 'login');
  }

   call_register(){
     Navigator.pushNamed(context, 'register');
   }
  @override
  Widget build(BuildContext context) {

    double avatarradius = MediaQuery.of(context).size.width * 0.063;
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.blue,
        Colors.blueAccent
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.transparent,
          elevation: 0,
          title: Text(
            "Inventory Management",style: TextStyle(
            fontSize: MediaQuery.of(context).size.height*0.03,
            color: Colors.yellow
          ),
          ),
          centerTitle: true,
        ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 150),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.80,
                      height: MediaQuery.of(context).size.height * 0.09,
                      child: Text('Welcome',
                          style: TextStyle(
                              fontSize: 60,
                              color: colorfile.login_button_colour,
                              fontWeight: FontWeight.bold,
                              fontFamily: '')),
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  SizedBox(
                    //color: Colors.red,
                       child: ActionSlider.standard(
                         action: (controller) async {
                           controller.loading(); // starts loading animation
                           await Future.delayed(const Duration(seconds:1));
                           controller.success(); // starts success animation
                           await Future.delayed(const Duration(seconds: 1));
                           controller.reset(); // resets the slider
                           call_login();
                           // Call your class or function here when the animation completes.
                           // Example: MyClass.myFunction();

                         },
                         rolling: true,
                         backgroundColor: colorfile.dark_blue,
                         toggleColor: Colors.blue,
                         width: MediaQuery.of(context).size.width*0.8,
                         height: MediaQuery.of(context).size.height*0.08,
                         icon: Icon(
                           Icons.login,
                           color: colorfile.login_button_colour,


                         ),


                         child: Text(
                           'Login',

                           style: TextStyle(

                             color: colorfile.login_button_colour,
                             fontSize: MediaQuery.of(context).size.height*0.03
                           ),
                         ),
                       )
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                  SizedBox(
                    //color: Colors.red,

                      child: ActionSlider.standard(
                        action: (controller) async {
                          controller.loading(); // starts loading animation
                          await Future.delayed(const Duration(seconds: 1));
                          controller.success(); // starts success animation
                          await Future.delayed(const Duration(seconds:1));

                          controller.reset(); // resets the slider
                          call_register();
                          // Call your class or function here when the animation completes.
                          // Example: MyClass.myFunction();

                        },
                        rolling: true,

                        backgroundColor: colorfile.dark_blue,
                        toggleColor: Colors.blue,
                        width: MediaQuery.of(context).size.width*0.8,
                        height: MediaQuery.of(context).size.height*0.08,
                        icon: Icon(
                          Icons.app_registration_rounded,
                          color: colorfile.login_button_colour,


                        ),


                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: colorfile.login_button_colour,
                              fontSize: MediaQuery.of(context).size.height*0.03
                          ),
                        ),
                      )
                  ),
                ],
              ),
            ),
          )),
    );

  }
}
