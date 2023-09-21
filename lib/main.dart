
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/Primary_page.dart';

import 'package:inventory_management/all_inventories/accessories.dart';
import 'package:inventory_management/all_inventories/books.dart';

import 'package:inventory_management/authpages/forgot_password.dart';
import 'package:inventory_management/authpages/login_page.dart';

import 'package:inventory_management/create_widget.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:inventory_management/all_inventories/furnitures.dart';
import 'package:inventory_management/select_inventory.dart';
import 'package:inventory_management/all_inventories/tools.dart';
import 'package:provider/provider.dart';

import 'authpages/register_page.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  firestore.settings = Settings(persistenceEnabled: false);
  runApp(

     MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'primary_page': (context) => primary_page(),
        'login': (context) => MyLogin(),
        'register': (context) => MyRegister(),
        'select_inventory': (context) => select_inventory(),
        'forgotpassword': (context) => forgotpassword(),
        'create_widget': (context) => create_widget(),
        'tools': (context) => Tools(),
        'accessories':(context)=>Accessories(),
        'furnitures':(context)=>Furnitures(),
        'books':(context)=>Books()


      },
      home: screen_chooser(),
    ),
  );
}






class screen_chooser extends StatefulWidget {
  const screen_chooser({super.key});

  @override
  State<screen_chooser> createState() => _screen_chooserState();
}

class _screen_chooserState extends State<screen_chooser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return select_inventory();
            } else {
              return primary_page();
            }
          }),
    );
  }
}
