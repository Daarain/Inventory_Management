import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'colorfile.dart';

class select_inventory extends StatefulWidget {
  const select_inventory({super.key});

  @override
  State<select_inventory> createState() => _select_inventoryState();
}

class _select_inventoryState extends State<select_inventory> {






  Future<void> signUSerOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.popAndPushNamed(context, 'primary_page');
  }

  @override
  Widget build(BuildContext context) {
    // final data_from_last_activity=ModalRoute.of(context)!.settings.arguments as String;
 // final Map<String? ,dynamic> arguments=ModalRoute.of(context)!.settings.arguments as Map<String?,dynamic>;
 //    final String? Email1=  arguments['Email1'] as String;
 //    final String? Password1=  arguments['Password1'] as String;


    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blueAccent,
              colorfile.dark_blue
            ]),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Inventories",
            style: TextStyle(
                color: Colors.yellow,
                fontSize: MediaQuery.of(context).size.height * 0.04,
                fontWeight: FontWeight.w900),
          ),
          actions: [
            Container(
              child:
                  IconButton(onPressed: signUSerOut, icon: Icon(Icons.logout)),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.12,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, 'tools');
                      // print('$Email1',);
                      // print('$Password1',);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26
                                .withOpacity(0.8), // Set the shadow color
                            spreadRadius: 5, // Spread radius of the shadow
                            blurRadius: 7, // Blur radius of the shadow
                            offset: Offset(0,
                                6), // Offset of the shadow (horizontal, vertical)
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                        image: DecorationImage(
                            image: AssetImage('assets/image/tools.png'),
                            fit: BoxFit.cover),
                      ),
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.76,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 120),
                        child: Text(
                          'Tools',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.04,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.12,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.12,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'accessories');

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26
                                .withOpacity(0.8), // Set the shadow color
                            spreadRadius: 5, // Spread radius of the shadow
                            blurRadius: 7, // Blur radius of the shadow
                            offset: Offset(0,
                                6), // Offset of the shadow (horizontal, vertical)
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                        image: DecorationImage(
                            image: AssetImage('assets/image/accessories.png'),
                            fit: BoxFit.cover),
                      ),
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.76,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 120),
                        child: Text(
                          'Accessories',
                          style: TextStyle(
                              color: Colors.yellowAccent,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.04,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.12,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.12,
                  ),
                  InkWell(
                    onTap: () {
             Navigator.pushNamed(context, 'furnitures');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26
                                .withOpacity(0.8), // Set the shadow color
                            spreadRadius: 5, // Spread radius of the shadow
                            blurRadius: 7, // Blur radius of the shadow
                            offset: Offset(0,
                                6), // Offset of the shadow (horizontal, vertical)
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                        image: DecorationImage(
                            image: AssetImage('assets/image/furnitures.png'),
                            fit: BoxFit.cover),
                      ),
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.76,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 120),
                        child: Text(
                          'Furnitures',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.04,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.12,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.12,
                  ),
                  InkWell(
                    onTap: () {
               Navigator.pushNamed(context, 'books');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26
                                .withOpacity(0.8), // Set the shadow color
                            spreadRadius: 5, // Spread radius of the shadow
                            blurRadius: 7, // Blur radius of the shadow
                            offset: Offset(0,
                                6), // Offset of the shadow (horizontal, vertical)
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                        image: DecorationImage(
                            image: AssetImage('assets/image/books.png'),
                            fit: BoxFit.cover),
                      ),
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.76,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 120),
                        child: Text(
                          'Books',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.04,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.12,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
