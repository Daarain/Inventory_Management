import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../colorfile.dart';

List<ListTile> listTiles = [];

class Furnitures extends StatefulWidget {
  const Furnitures({Key? key}) : super(key: key);

  @override
  State<Furnitures> createState() => _FurnituresState();
}

class _FurnituresState extends State<Furnitures> {
  Future<void> fetchInitialData() async {
    try {
      final QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection("Furnitures").get();
      final List<QueryDocumentSnapshot> documents = querySnapshot.docs;

      listTiles.clear();

      for (var document in documents) {
        final productName = document["Product_name"] as String;
        final productQuantity = document["Product_Qauntity"] as String;

        listTiles.add(
          ListTile(
            title: Text(
              productName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
                fontSize: MediaQuery.of(context).size.height * 0.03,
              ),
            ),
            subtitle: Text(
              "Quantity: $productQuantity",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        );
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: fetchInitialData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // Data loading is complete, return the UI
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.brown,
                  Colors.brown,
                ],
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: Text(
                  'Furnitures',
                  style: TextStyle(
                    color: colorfile.login_button_colour,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.04,
                  ),
                ),
                centerTitle: true,
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: colorfile.login_button_colour,
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return CustomDialog();
                    },
                  );
                },
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
              body: ListView(
                children: listTiles,
              ),
            ),
          );
        } else {
          // Data loading is in progress, return a loading indicator
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.brown,
                  Colors.brown,
                ],
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: Text(
                  'Furnitures',
                  style: TextStyle(
                    color: colorfile.login_button_colour,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.04,
                  ),
                ),
                centerTitle: true,
              ),
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }
}

class CustomDialog extends StatefulWidget {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productQuantityController = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.brown,
              Colors.brown,
            ],
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.35,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              child: Text(
                'Set Attributes',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                  color: colorfile.login_button_colour,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.09,
              width: MediaQuery.of(context).size.width * 0.6,
              child: TextField(
                controller: productNameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white38,
                  hintText: "Enter Product's name",
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: 'Product Name',
                  labelStyle: TextStyle(color: Colors.white),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02,
                    horizontal: MediaQuery.of(context).size.height * 0.02,
                  ),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 3),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.002,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.09,
              width: MediaQuery.of(context).size.width * 0.6,
              child: TextField(
                controller: productQuantityController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white38,
                  hintText: "Enter Product's quantity",
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: 'Product Quantity',
                  labelStyle: TextStyle(color: Colors.white),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02,
                    horizontal: MediaQuery.of(context).size.height * 0.02,
                  ),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 3),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.08,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancel"),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.04,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorfile.login_button_colour,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      addProduct();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Create",
                      style: TextStyle(
                        color: colorfile.background_screen_dark,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> addProduct() async {
    try {
      final productName = productNameController.text;
      final productQuantity = productQuantityController.text;

      await firestore.collection("Furnitures").doc(productName).set({
        "Product_name": productName,
        "Product_Qauntity": productQuantity,
      });

      print("Product added to the database");
      productNameController.clear();
      productQuantityController.clear();

      // Update the UI by adding a new ListTile
      setState(() {
        listTiles.add(
          ListTile(
            title: Text(
              productName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
                fontSize: MediaQuery.of(context).size.height * 0.03,
              ),
            ),
            subtitle: Text(
              "Quantity: $productQuantity",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        );
      });
    } catch (e) {
      print("Error adding product to the database: $e");
    }
  }
}
