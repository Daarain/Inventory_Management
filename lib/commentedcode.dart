// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:inventory_management/colorfile.dart';
//
// List<Container> containerList = [];
//
// class tools extends StatefulWidget {
//   const tools({super.key});
//
//   @override
//   State<tools> createState() => _toolsState();
// }
//
// class _toolsState extends State<tools> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 colorfile.background_screen_dark,
//                 colorfile.background_screen_light
//               ])),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           title: Text(
//             'Tools',
//             style: TextStyle(
//                 color: Colors.yellow,
//                 fontWeight: FontWeight.bold,
//                 fontSize: MediaQuery.of(context).size.height * 0.04),
//           ),
//           centerTitle: true,
//         ),
//         floatingActionButton: FloatingActionButton(
//           backgroundColor: Colors.pink,
//           onPressed: () {
//             showDialog(
//                 context: context,
//                 barrierDismissible: false,
//                 builder: (BuildContext context) {
//                   return Customdialog();
//                 });
//           },
//           child: Icon(Icons.add),
//         ),
//         body: ListView.builder(
//           itemCount: containerList.length,
//           itemBuilder: (BuildContext context, int index) {
//             return containerList[index];
//           },
//         ),
//       ),
//     );
//   }
// }
//
// // Custom dialog
//
// class Customdialog extends StatefulWidget {
//   const Customdialog({super.key});
//
//   @override
//   State<Customdialog> createState() => _CustomdialogState();
// }
//
// class _CustomdialogState extends State<Customdialog> {
//   TextEditingController Product_name = new TextEditingController();
//   TextEditingController Product_present_qauntity = new TextEditingController();
//   TextEditingController Product_price = new TextEditingController();
//   TextEditingController Product_Incoming_qauntity = new TextEditingController();
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//         backgroundColor: Colors.transparent,
//         contentPadding: EdgeInsets.zero,
//         content: Container(
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(30),
//               gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     colorfile.background_screen_light,
//                     colorfile.background_screen_dark
//                   ])),
//           height: MediaQuery.of(context).size.height * 0.5,
//           child: Column(
//             children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.01,
//               ),
//               Container(
//                 child: Text(
//                   'Set Attributes',
//                   style: TextStyle(
//                       fontSize: MediaQuery.of(context).size.height * 0.03,
//                       color: colorfile.login_button_colour,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.02,
//               ),
//               Container(
//                 height: MediaQuery.of(context).size.height * 0.09,
//                 width: MediaQuery.of(context).size.width * 0.6,
//                 child: TextField(
//                   controller: Product_name,
//                   decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white38,
//                       hintText: "Enter Product's name ",
//                       hintStyle: TextStyle(color: Colors.white),
//                       labelText: 'Product Name',
//                       labelStyle: TextStyle(color: Colors.white),
//                       floatingLabelBehavior: FloatingLabelBehavior.always,
//                       contentPadding: EdgeInsets.symmetric(
//                           vertical: MediaQuery.of(context).size.height * 0.02,
//                           horizontal:
//                           MediaQuery.of(context).size.height * 0.02),
//                       border: OutlineInputBorder(),
//                       enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: BorderSide(
//                             color: Colors.black,
//                             width: 2,
//                           )),
//                       focusedBorder: OutlineInputBorder(
//                           borderSide:
//                           BorderSide(color: Colors.blueAccent, width: 3))),
//                 ),
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.002,
//               ),
//               Container(
//                 height: MediaQuery.of(context).size.height * 0.09,
//                 width: MediaQuery.of(context).size.width * 0.6,
//                 child: TextField(
//                   controller: Product_present_qauntity,
//                   decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white38,
//                       hintText: "Enter Product's present qauntity",
//                       hintStyle: TextStyle(color: Colors.white),
//                       labelText: " Present qauntity",
//                       labelStyle: TextStyle(color: Colors.white),
//                       floatingLabelBehavior: FloatingLabelBehavior.always,
//                       contentPadding: EdgeInsets.symmetric(
//                           vertical: MediaQuery.of(context).size.height * 0.02,
//                           horizontal:
//                           MediaQuery.of(context).size.height * 0.02),
//                       border: OutlineInputBorder(),
//                       enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: BorderSide(
//                             color: Colors.black,
//                             width: 2,
//                           )),
//                       focusedBorder: OutlineInputBorder(
//                           borderSide:
//                           BorderSide(color: Colors.blueAccent, width: 3))),
//                 ),
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.002,
//               ),
//               Container(
//                 height: MediaQuery.of(context).size.height * 0.09,
//                 width: MediaQuery.of(context).size.width * 0.6,
//                 child: TextField(
//                   controller: Product_price,
//                   decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white38,
//                       hintText: "Enter Product's price ",
//                       hintStyle: TextStyle(color: Colors.white),
//                       labelText: "Product's price",
//                       labelStyle: TextStyle(color: Colors.white),
//                       floatingLabelBehavior: FloatingLabelBehavior.always,
//                       contentPadding: EdgeInsets.symmetric(
//                           vertical: MediaQuery.of(context).size.height * 0.02,
//                           horizontal:
//                           MediaQuery.of(context).size.height * 0.02),
//                       border: OutlineInputBorder(),
//                       enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: BorderSide(
//                             color: Colors.black,
//                             width: 2,
//                           )),
//                       focusedBorder: OutlineInputBorder(
//                           borderSide:
//                           BorderSide(color: Colors.blueAccent, width: 3))),
//                 ),
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.002,
//               ),
//               Container(
//                 height: MediaQuery.of(context).size.height * 0.09,
//                 width: MediaQuery.of(context).size.width * 0.6,
//                 child: TextField(
//                   controller: Product_Incoming_qauntity,
//                   decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white38,
//                       hintText: "Enter Product's incoming qauntity",
//                       hintStyle: TextStyle(color: Colors.white),
//                       labelText: "Incoming Qauntity",
//                       labelStyle: TextStyle(color: Colors.white),
//                       floatingLabelBehavior: FloatingLabelBehavior.always,
//                       contentPadding: EdgeInsets.symmetric(
//                           vertical: MediaQuery.of(context).size.height * 0.02,
//                           horizontal:
//                           MediaQuery.of(context).size.height * 0.02),
//                       border: OutlineInputBorder(),
//                       enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: BorderSide(
//                             color: Colors.black,
//                             width: 2,
//                           )),
//                       focusedBorder: OutlineInputBorder(
//                           borderSide:
//                           BorderSide(color: Colors.blueAccent, width: 3))),
//                 ),
//               ),
//               Row(
//                 children: [
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.08,
//                   ),
//                   Container(
//                     height: MediaQuery.of(context).size.height * 0.05,
//                     width: MediaQuery.of(context).size.width * 0.25,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.transparent,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20))),
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: Text("Cancel"),
//                     ),
//                   ),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.04,
//                   ),
//                   Container(
//                       height: MediaQuery.of(context).size.height * 0.05,
//                       width: MediaQuery.of(context).size.width * 0.25,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: colorfile.login_button_colour,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20))),
//                         onPressed: () {
//                           addproduct();
//                           setState(() {
//                             containerList.add(
//                                 Container(
//                                   color: colorfile.background_screen_dark,
//                                   child:Row(
//                                     children: [
//                                       Column(
//                                         children: [
//                                           Row(
//                                             children: [
//                                               SizedBox(
//                                                 width: MediaQuery.of(context).size.width*0.01,
//                                               ),
//                                               Container(
//                                                 child: Text("Hello world",style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.03 ),),
//                                               ),
//                                               SizedBox(width: MediaQuery.of(context).size.width*0.2,),
//                                               Container(child: Text("HEllo world",style: TextStyle(fontSize:  MediaQuery.of(context).size.height*0.03 ),),)
//                                             ],
//                                           ),
//                                           Row(
//                                             children: [
//                                               SizedBox(
//                                                 width: MediaQuery.of(context).size.width*0.01,
//                                               ),
//                                               Container(
//                                                 child: Text("Hello world",style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.03 ),),
//                                               ),
//                                               SizedBox(width: MediaQuery.of(context).size.width*0.2,),
//                                               Container(child: Text("HEllo world",style: TextStyle(fontSize:  MediaQuery.of(context).size.height*0.03 ),),)
//                                             ],
//                                           ),
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 ));
//                           });
//                           Navigator.of(context).pop();
//                         },
//                         child: Text(
//                           "Create",
//                           style: TextStyle(
//                               color: colorfile.background_screen_dark),
//                         ),
//                       ))
//                 ],
//               )
//             ],
//           ),
//         ));
//   }
//
//   Future<void> addproduct() async {
//     try {
//       await firestore.collection("Tools").doc(Product_name.text).set({
//         "Product_name": Product_name.text,
//         "Product_Qauntity": Product_present_qauntity.text,
//         "Product_Price": Product_price.text,
//         "Product_incoming_qauntity": Product_Incoming_qauntity.text
//       });
//       print("the method is working");
//     } catch (e) {
//       print("The problem is :$e");
//     }
//   }
// }



// class CustomDialog extends StatefulWidget {
//   const CustomDialog({super.key});
//
//   @override
//   State<CustomDialog> createState() => _CustomDialogState();
// }
//
// class _CustomDialogState extends State<CustomDialog> {
//   TextEditingController productNameController = TextEditingController();
//   TextEditingController productQuantityController = TextEditingController();
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       backgroundColor: Colors.transparent,
//       contentPadding: EdgeInsets.zero,
//       content: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30),
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               colorfile.background_screen_light,
//               colorfile.background_screen_dark,
//             ],
//           ),
//         ),
//         height: MediaQuery.of(context).size.height * 0.35,
//         child: Column(
//           children: [
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             Container(
//               child: Text(
//                 'Set Attributes',
//                 style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * 0.03,
//                   color: colorfile.login_button_colour,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.02,
//             ),
//             Container(
//               height: MediaQuery.of(context).size.height * 0.09,
//               width: MediaQuery.of(context).size.width * 0.6,
//               child: TextField(
//                 controller: productNameController,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white38,
//                   hintText: "Enter Product's name",
//                   hintStyle: TextStyle(color: Colors.white),
//                   labelText: 'Product Name',
//                   labelStyle: TextStyle(color: Colors.white),
//                   floatingLabelBehavior: FloatingLabelBehavior.always,
//                   contentPadding: EdgeInsets.symmetric(
//                     vertical: MediaQuery.of(context).size.height * 0.02,
//                     horizontal: MediaQuery.of(context).size.height * 0.02,
//                   ),
//                   border: OutlineInputBorder(),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide(
//                       color: Colors.black,
//                       width: 2,
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blueAccent, width: 3),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.002,
//             ),
//             Container(
//               height: MediaQuery.of(context).size.height * 0.09,
//               width: MediaQuery.of(context).size.width * 0.6,
//               child: TextField(
//                 controller: productQuantityController,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white38,
//                   hintText: "Enter Product's quantity",
//                   hintStyle: TextStyle(color: Colors.white),
//                   labelText: 'Product Quantity',
//                   labelStyle: TextStyle(color: Colors.white),
//                   floatingLabelBehavior: FloatingLabelBehavior.always,
//                   contentPadding: EdgeInsets.symmetric(
//                     vertical: MediaQuery.of(context).size.height * 0.02,
//                     horizontal: MediaQuery.of(context).size.height * 0.02,
//                   ),
//                   border: OutlineInputBorder(),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide(
//                       color: Colors.black,
//                       width: 2,
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blueAccent, width: 3),
//                   ),
//                 ),
//               ),
//             ),
//             Row(
//               children: [
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.08,
//                 ),
//                 Container(
//                   height: MediaQuery.of(context).size.height * 0.05,
//                   width: MediaQuery.of(context).size.width * 0.25,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.transparent,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: Text("Cancel"),
//                   ),
//                 ),
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.04,
//                 ),
//                 Container(
//                   height: MediaQuery.of(context).size.height * 0.05,
//                   width: MediaQuery.of(context).size.width * 0.25,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: colorfile.login_button_colour,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                     onPressed: () {
//                       addProduct();
//                       Navigator.of(context).pop();
//                     },
//                     child: Text(
//                       "Create",
//                       style: TextStyle(
//                         color: colorfile.background_screen_dark,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> addProduct() async {
//     try {
//       final productName = productNameController.text;
//       final productQuantity = productQuantityController.text;
//
//       await firestore.collection("Tools").doc(productName).set({
//         "Product_name": productName,
//         "Product_Qauntity": productQuantity,
//       });
//
//       print("Product added to the database");
//       productNameController.clear();
//       productQuantityController.clear();
//
//       // Update the UI by adding a new ListTile
//       setState(() {
//         listTiles.add(
//
//           ListTile(
//             tileColor: Colors.yellowAccent,
//             title: Text(productName,style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.05),),
//             subtitle: Text("Quantity: $productQuantity"),
//
//
//           ),
//         );
//       });
//     } catch (e) {
//       print("Error adding product to the database: $e");
//     }
//   }
// }
