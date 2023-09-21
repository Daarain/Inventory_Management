import 'package:action_slider/action_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:inventory_management/colorfile.dart';

class forgotpassword extends StatefulWidget {
  const forgotpassword({super.key});

  @override
  State<forgotpassword> createState() => _forgotpasswordState();
}

class _forgotpasswordState extends State<forgotpassword> {
  TextEditingController Email = TextEditingController();

  void emailremindertoast() {
    Fluttertoast.showToast(
        msg: 'enter your email',
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 16,
        textColor: Colors.white,
        backgroundColor: Colors.black);
  }

  void resetemailsenttoast() {
    Fluttertoast.showToast(
        msg: 'Email for password reset is sent ',
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 16,
        textColor: Colors.black12);
  }

  Future<void> passwrod_reset() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: Email.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              colorfile.background_screen_dark,
              colorfile.login_button_colour
            ])),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.06,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextField(
                        controller: Email,
                        onTap: emailremindertoast,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white38,
                            hintText: 'Enter your E-mail',
                            hintStyle: TextStyle(color: Colors.white),
                            labelText: 'E-mail',
                            labelStyle: TextStyle(color: Colors.white),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.02,
                                horizontal:
                                    MediaQuery.of(context).size.height * 0.02),
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 3))),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Container(
                    //color: Colors.red,
                    child: ActionSlider.standard(
                  action: (controller) async {
                    controller.loading(); // starts loading animation
                    passwrod_reset();
                    await Future.delayed(const Duration(seconds: 3));
                    resetemailsenttoast();
                    controller.success(); // starts success animation
                    await Future.delayed(const Duration(seconds: 1));
                    controller.reset(); // resets the slider
                    passwrod_reset();
                    // Call your class or function here when the animation completes.
                    // Example: MyClass.myFunction();
                  },
                  rolling: true,
                  backgroundColor: colorfile.background_screen_dark,
                  toggleColor: colorfile.background_screen_light,
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.08,
                  icon: Icon(
                    Icons.send,
                    color: colorfile.login_button_colour,
                  ),
                  child: Text(
                    'Send',
                    style: TextStyle(
                        color: colorfile.login_button_colour,
                        fontSize: MediaQuery.of(context).size.height * 0.03),
                  ),
                )),
              ],
            ),
          ),
        ));
  }
}
