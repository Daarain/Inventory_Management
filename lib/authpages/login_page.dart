import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:inventory_management/colorfile.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();





  // void screenchanger() {
  //   if (FirebaseAuth.instance.currentUser != null) {
  //     Fluttertoast.showToast(
  //         msg: 'Login Successfull  ',
  //         toastLength: Toast.LENGTH_SHORT,
  //         backgroundColor: Colors.grey,
  //         fontSize: 16,
  //         textColor: Colors.white);
  //     //Navigator.pushReplacementNamed(context, "select_inventory");
  //     Navigator.pushReplacementNamed(context, 'select_inventory');
  //   } else {}
  // }

  void SignUserIn() async {

    String? email1=Email.text;
    String? password1=Password.text;

    datapassing d1=datapassing(email1, password1);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: Email.text, password: Password.text);
      Navigator.popAndPushNamed(context, 'select_inventory',arguments: d1);



    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
            msg: 'Please Register  ',
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: Colors.grey,
            fontSize: 16,
            textColor: Colors.white);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');

        Fluttertoast.showToast(
            msg: 'Please Enter correct Password',
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: Colors.grey,
            fontSize: 16,
            textColor: Colors.white);
      }
    }
// showDialog(context: context, builder: (context)
// {
//   return const Center(
//     child: CircularProgressIndicator(),
//
//   );
//
// },
//
// );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              colorfile.dark_blue
            ]),
        //image: DecorationImage(
        //image: AssetImage('assets/image/Login_page.jpg'),
        //fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,

          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(

                  //color: Colors.yellow,

                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Image.asset(
                      'assets/image/Inventory_management_logo.png')),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Container(
                //color: Colors.black,

                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextField(
                        controller: Email,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white38,
                            hintText: 'Enter your E-mail',
                            hintStyle: TextStyle(color: Colors.white),
                            labelText: 'E-mail',
                            labelStyle: TextStyle(color: Colors.white
                            ),
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
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
                            hintText: 'Enter your Password',
                            hintStyle: TextStyle(color: Colors.white),
                            labelText: 'Password',
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
                                    color: Colors.blueAccent, width: 2))),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.08,
                        ),
                        Text(
                          'Sign in',
                          style: TextStyle(
                              color: colorfile.login_button_colour,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.05,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: colorfile.login_button_colour,
                          child: IconButton(
                            onPressed: () {
                              SignUserIn();
                              // screenchanger();
                              // print('Entered email is '+_email);
                              // print('Entered password is '+_password);
                            },
                            color: Colors.black,
                            icon: Icon(
                              Icons.arrow_forward,
                              size: MediaQuery.of(context).size.height * 0.03,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.06,
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'forgotpassword');
                            },
                            child: Text("Forgot password",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    decoration: TextDecoration.underline,
                                    color: colorfile.login_button_colour)))
                      ],
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
class datapassing{


  late String? Email1;
  late String? Password1;


  datapassing(this.Email1,this.Password1);

}