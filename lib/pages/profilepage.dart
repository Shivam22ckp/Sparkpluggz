import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sparkplugzapp/pages/address_page.dart';
import 'package:sparkplugzapp/services/database.dart';
import 'package:sparkplugzapp/services/shared_pref.dart';

class Profilepage extends StatefulWidget {
  @override
  _ProfilepageState createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  String profilePicUrl = "",
      name = "",
      id = "",
      username = "",
      address = "",
      phone = "",
      email = "";
  getMyInfoFromSharedPreference() async {
    username = await SharedPreferenceHelper().getDisplayName();
  }

  getThisUserInfo() async {
    await getMyInfoFromSharedPreference();
    QuerySnapshot querySnapshot = await DatabaseMethods().getUserInfo(username);
    print(
        "something bla bla ${querySnapshot.docs[0].id} ${querySnapshot.docs[0]["name"]}  ${querySnapshot.docs[0]["Address"]}");

    name = "${querySnapshot.docs[0]["name"]}";
    id = "${querySnapshot.docs[0].id}";
    profilePicUrl = "${querySnapshot.docs[0]["ProfileUrl"]}";
    address = "${querySnapshot.docs[0]["Address"]}";
    phone = "${querySnapshot.docs[0]["Phone"]}";
    email = "${querySnapshot.docs[0]["email"]}";
    setState(() {});
  }

  @override
  void initState() {
    getThisUserInfo();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Profile",
                    style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Pacifico'),
                  ),
                  SizedBox(
                    width: 50.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      DatabaseMethods().deleteAddress(id).then((value) =>
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddressPage())));
                    },
                    child: Text(
                      "Edit",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Container(
                  height: 120.0,
                  width: 120.0,
                  child: Image.network(
                    profilePicUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    name,
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Icon(
                    Icons.email,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    email,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(Icons.phone, color: Colors.blueAccent),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(phone,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    address,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
