import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Profilewidget extends StatefulWidget {
  const Profilewidget({ Key? key }) : super(key: key);

  @override
  _ProfilewidgetState createState() => _ProfilewidgetState();
}

class _ProfilewidgetState extends State<Profilewidget> {
  @override
  TextEditingController? _nameController;
  TextEditingController? _phoneController;
  TextEditingController? _ageController;
  SetDataToTextField(data) {
    return Column(
      children: [
        TextField(
          controller: _nameController = 
          TextEditingController(text: data['name']),
        ),
        TextField(
          controller: _phoneController = 
          TextEditingController(text: data['phone']),
        ),
        TextField(
          controller: _ageController = 
          TextEditingController(text: data['age']),
        ),
        ElevatedButton(onPressed: ()=> updateData() , 
        child: Text("update"))
        
      ],
    );
  }
  updateData() {
    CollectionReference _collectionRef = 
    FirebaseFirestore.instance.collection("users_form_data");
    return _collectionRef.doc(FirebaseAuth.instance.currentUser!.email).update({
      "name" : _nameController!.text,
      "phone" : _phoneController!.text,
      "age" : _ageController!.text,
    }).then((value) => print("Updated Successfully"));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                  .collection("users_form_data")
                  .doc(FirebaseAuth.instance.currentUser!.email)
                  .snapshots(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    var data = snapshot.data;
                    if (data == null) {
                      return Center(
                        child: CircularProgressIndicator(),
                        );
                    }
                    return SetDataToTextField(data);
                  })
              ],
            ),
          ),
        )),
    );
  }
}