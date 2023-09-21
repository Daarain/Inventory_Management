import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:inventory_management/colorfile.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController Username = TextEditingController();
  void showtoast() {
    Fluttertoast.showToast(
        msg: 'Email already is use',
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.grey,
        fontSize: 16,
        textColor: Colors.white);
  }

  Future<void> registerUserIn() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: Email.text.toString(), password: Password.text.toString());
      Navigator.pushNamed(context, 'first_page');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showtoast();
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            colorfile.background_screen_light,
            colorfile.dark_blue
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
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.14,
                // padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.25,top: MediaQuery.of(context).size.height*0.03),
                child: Text(
                  'Register',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: colorfile.login_button_colour,
                      fontSize: MediaQuery.of(context).size.height * 0.09),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.15,),
              Container(

                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.09,
                      child: TextField(
                          controller: Email,
                          decoration: InputDecoration(
                              hintText: 'Enter your E-mail',
                              labelText: 'E-mail',
                              filled: true,
                              fillColor: Colors.white38,
                              labelStyle: TextStyle(color: colorfile.background_screen_dark),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height * 0.02,
                                  horizontal: MediaQuery.of(context).size.width * 0.05),
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2)))),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.02
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.09,

                      child: TextField(

                        controller: Password,
                        obscureText: true,
                        decoration: InputDecoration(
                           filled: true,
                            fillColor: Colors.white38,
                            hintText: 'Password',
                            labelText: 'Password',
                            labelStyle: TextStyle(color: colorfile.background_screen_dark,),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: MediaQuery.of(context).size.height*0.02, horizontal: MediaQuery.of(context).size.width*0.05),
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            )),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2))),
                      ),
                    ),
                    SizedBox(height: 50),
                    Row(

                      children: [
                       SizedBox(
                         width: MediaQuery.of(context).size.width*0.1,
                       ),
                        Text(
                          'Register',
                          style: TextStyle(
                            color:colorfile.background_screen_dark,
                              fontSize: MediaQuery.of(context).size.height*0.04, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.30,
                        ),
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.black,
                          child: IconButton(
                            color: Colors.yellowAccent,
                            onPressed: () {
                              registerUserIn();
                            },
                            icon: Icon(Icons.arrow_forward),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.05,
                        )
                      ],
                      // ),
                      // SizedBox(
                      //   height: 25,
                      // ),

                      // Row(mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     TextButton(onPressed: (){
                      //       Navigator.pushNamed(context, 'login');
                      //       }, child: Text('Sign in', style: TextStyle(decoration: TextDecoration.underline,fontSize: 25,fontWeight: FontWeight.w800,color:Colors.blueAccent),)),
                      //   ],
                      // )
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
