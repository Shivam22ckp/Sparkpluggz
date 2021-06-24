import 'package:flutter/material.dart';
import 'package:sparkplugzapp/pages/batteries.dart';
import 'package:sparkplugzapp/pages/batteriescategory.dart';
import 'package:sparkplugzapp/pages/brakepad.dart';
import 'package:sparkplugzapp/pages/brakeshoe.dart';
import 'package:sparkplugzapp/pages/rotor.dart';
import 'package:sparkplugzapp/services/auth.dart';
import 'package:sparkplugzapp/services/signin.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "Select Category",
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Pacifico'),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        AuthMethods().signOut().then((s) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignIn()));
                        });
                      },
                      child: Icon(
                        Icons.exit_to_app,
                        size: 30.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ]),
              SizedBox(
                height: 30.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BatteriesCategory()));
                },
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(children: <Widget>[
                      Container(
                        height: 200,
                        width: 300,
                        child: Image.asset(
                          "images/car batteries.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: 0.0,
                        bottom: 0.0,
                        child: Container(
                          height: 60.0,
                          width: 500.0,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                Colors.black,
                                Colors.black12,
                              ],
                                  begin: Alignment.bottomCenter,
                                  end: AlignmentDirectional.topCenter)),
                        ),
                      ),
                      Positioned(
                        left: 10.0,
                        bottom: 10.0,
                        right: 10.0,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Car Batteries",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    ]),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Brakepad()));
                },
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(children: <Widget>[
                      Container(
                        height: 200,
                        width: 300,
                        child: Image.asset(
                          "images/brakepad3.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: 0.0,
                        bottom: 0.0,
                        child: Container(
                          height: 60.0,
                          width: 500.0,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                Colors.black,
                                Colors.black12,
                              ],
                                  begin: Alignment.bottomCenter,
                                  end: AlignmentDirectional.topCenter)),
                        ),
                      ),
                      Positioned(
                        left: 10.0,
                        bottom: 10.0,
                        right: 10.0,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Brake Pad",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    ]),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BrakeShoe()));
                },
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(children: <Widget>[
                      Container(
                        height: 200,
                        width: 300,
                        child: Image.asset(
                          "images/brakeshoe.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: 0.0,
                        bottom: 0.0,
                        child: Container(
                          height: 60.0,
                          width: 500.0,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                Colors.black,
                                Colors.black12,
                              ],
                                  begin: Alignment.bottomCenter,
                                  end: AlignmentDirectional.topCenter)),
                        ),
                      ),
                      Positioned(
                        left: 10.0,
                        bottom: 10.0,
                        right: 10.0,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Brake Shoes",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    ]),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Rotor()));
                },
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(children: <Widget>[
                      Container(
                        height: 200,
                        width: 300,
                        child: Image.asset(
                          "images/carrotor.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: 0.0,
                        bottom: 0.0,
                        child: Container(
                          height: 60.0,
                          width: 500.0,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                Colors.black,
                                Colors.black12,
                              ],
                                  begin: Alignment.bottomCenter,
                                  end: AlignmentDirectional.topCenter)),
                        ),
                      ),
                      Positioned(
                        left: 10.0,
                        bottom: 10.0,
                        right: 10.0,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Car Rotor",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
