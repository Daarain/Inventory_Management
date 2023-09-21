import 'dart:core';


import 'package:flutter/cupertino.dart';

class inventory_items{
  late String Product_name;
  late String Product_present_qauntity;
  late  String Product_price;
  late String Product_incoming_qauntity;


  inventory_items({
    required this.Product_name,
    required this.Product_present_qauntity,
    required this.Product_price,
    required this.Product_incoming_qauntity

  });
}

List<inventory_items> tools_inventory=[
  inventory_items(Product_name: 'wrench', Product_present_qauntity: '20', Product_price: '100 rs', Product_incoming_qauntity: '80'),
  inventory_items(Product_name: 'pana', Product_present_qauntity: "20", Product_price: "2000", Product_incoming_qauntity: '100'),
  inventory_items(Product_name: 'pana', Product_present_qauntity: "20", Product_price: "2000", Product_incoming_qauntity: '100'),
  inventory_items(Product_name: 'pana', Product_present_qauntity: "20", Product_price: "2000", Product_incoming_qauntity: '100'),
];
List<inventory_items> accessories_inventory=[
  inventory_items(Product_name: 'mobile covers', Product_present_qauntity: '', Product_price: '', Product_incoming_qauntity: '')
];
List<inventory_items> Furnitures_inventory=[
  inventory_items(Product_name: 'tables', Product_present_qauntity: '', Product_price: '', Product_incoming_qauntity: '')
];
List<inventory_items> Books_inventory=[
  inventory_items(Product_name: 'harry porter', Product_present_qauntity: '', Product_price: '', Product_incoming_qauntity: '')
];

List<Widget> containers=[];
