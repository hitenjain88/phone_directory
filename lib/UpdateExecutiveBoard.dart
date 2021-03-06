import 'dart:ui';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:phone_directory/models/User.dart';

class UpdateExecutiveBoard extends StatefulWidget {
  User user;

  UpdateExecutiveBoard({this.user});

  @override
  State<StatefulWidget> createState() {
    return UpdateExecutiveBoardState();
  }
}

class UpdateExecutiveBoardState extends State<UpdateExecutiveBoard> {
  String name, phone, designation, address, priority;

  TextEditingController nameController,
      priorityController,
      phoneController,
      designationController,
      addressController;

  @override
  void initState() {
    super.initState();

    name = widget.user.name;
    priority=widget.user.priority;
    phone = widget.user.phone;
    designation = widget.user.designation;
    address = widget.user.address;

    nameController = TextEditingController(text: widget.user.name);
    phoneController = TextEditingController(text: widget.user.phone);
    designationController =
        TextEditingController(text: widget.user.designation);
    priorityController=TextEditingController(text: widget.user.priority);
    addressController = TextEditingController(text: widget.user.address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseDatabase.instance
              .reference()
              .child('executiveBoard')
              .child(widget.user.key)
              .set({
          'name': name,
          'phone': phone,
          'priority': priority,
          'address': address,
          'designation': designation
          });
          Navigator.pop(context, true);
        },
        child: Icon(
          Icons.keyboard_arrow_right,
          size: 40.0,
        ),
        backgroundColor: Colors.red,
      ),
      appBar: AppBar(
        title: Text("Update Executive Member Details"),
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.5, 0.9],
                    colors: [Colors.red, Colors.deepOrange.shade300])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                    minRadius: 60,
                    backgroundColor: Colors.deepOrange.shade300,
                    child: Icon(
                      Icons.person,
                      size: 80,
                      color: Colors.red,
                    )),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 12.0, right: 12.0),
            child: TextFormField(
              onChanged: (value) {
                designation = designationController.text;
              },
              keyboardType: TextInputType.text,
              controller: designationController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.location_on,
                  color: Colors.red,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0))),
                hintText: "Enter New Designation",
                hintStyle: TextStyle(fontSize: 20.0),
                labelStyle:
                TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                labelText: "Designation",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0))),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 12.0, right: 12.0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: nameController,
              onChanged: (value) {
                name = value;
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.red,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.redAccent, width: 2.0),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(25.0))),
                  hintText: "Enter New Name",
                  hintStyle: TextStyle(fontSize: 20.0),
                  labelStyle:
                  TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                  labelText: "Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0)))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 12.0, right: 12.0),
            child: TextFormField(
              onChanged: (value) {
                phone = value;
              },
              keyboardType: TextInputType.number,
              controller: phoneController,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.red,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.redAccent, width: 2.0),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(25.0))),
                  hintText: "Enter New Phone Number",
                  hintStyle: TextStyle(fontSize: 20.0),
                  labelStyle:
                  TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                  labelText: "Phone Number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(25.0)))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 12.0, right: 12.0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: priorityController,
              onChanged: (value) {
                priority = value;
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.swap_vertical_circle,
                    color: Colors.red,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.redAccent, width: 2.0),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(25.0))),
                  hintText: "Enter New Priority",
                  hintStyle: TextStyle(fontSize: 20.0),
                  labelStyle:
                  TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                  labelText: "Priority",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0)))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 12.0, right: 12.0),
            child: TextFormField(
              onChanged: (value) {
                address = addressController.text;
              },
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: addressController,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.home,
                    color: Colors.red,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.redAccent, width: 2.0),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(25.0))),
                  hintText: "Enter New Address",
                  hintStyle: TextStyle(fontSize: 20.0),
                  labelStyle:
                  TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                  labelText: "Address",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(25.0)))),
            ),
          ),
        ],
      ),
    );
  }
}
