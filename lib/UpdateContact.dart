import 'dart:ui';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:phone_directory/models/User.dart';

class UpdateContact extends StatefulWidget {
  String areaName, part;
  User user;

  UpdateContact({this.areaName, this.user, this.part});

  @override
  State<StatefulWidget> createState() {
    return UpdateContactState();
  }
}

class UpdateContactState extends State<UpdateContact> {
  String area, name, phone, email, address;

  TextEditingController areaController,
      nameController,
      phoneController,
      emailController,
      addressController;

  @override
  void initState() {
    super.initState();

    area = widget.areaName;
    name = widget.user.name;
    phone = widget.user.phone;
    email = widget.user.email;
    address = widget.user.address;

    areaController = TextEditingController(text: widget.areaName);
    nameController = TextEditingController(text: widget.user.name);
    phoneController = TextEditingController(text: widget.user.phone);
    emailController = TextEditingController(text: widget.user.email);
    addressController = TextEditingController(text: widget.user.address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (area == widget.areaName) {
            FirebaseDatabase.instance
                .reference()
                .child('area${widget.part}')
                .child(widget.areaName)
                .child(widget.user.key)
                .set({
              'name': name,
              'phone': phone,
              'email': email,
              'address': address
            });
          } else {
            FirebaseDatabase.instance
                .reference()
                .child('area${widget.part}')
                .child(area)
                .push()
                .set({
              'name': name,
              'phone': phone,
              'email': email,
              'address': address
            });
            FirebaseDatabase.instance
                .reference()
                .child('area${widget.part}')
                .child(widget.areaName)
                .child(widget.user.key)
                .remove();
          }
          Navigator.pop(context, true);
        },
        child: Icon(
          Icons.keyboard_arrow_right,
          size: 40.0,
        ),
        backgroundColor: Colors.red,
      ),
      appBar: AppBar(
        title: Text("Update Contact Details"),
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
                area = areaController.text;
              },
              keyboardType: TextInputType.text,
              controller: areaController,
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
                hintText: "Enter New Area",
                hintStyle: TextStyle(fontSize: 20.0),
                labelStyle:
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                labelText: "Area",
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
              onChanged: (value) {
                email = value;
              },
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.red,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.redAccent, width: 2.0),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(25.0))),
                  hintText: "Enter New E-mail",
                  hintStyle: TextStyle(fontSize: 20.0),
                  labelStyle:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                  labelText: "E-mail",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(25.0)))),
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
