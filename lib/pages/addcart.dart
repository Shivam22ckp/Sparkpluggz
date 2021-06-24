import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sparkplugzapp/services/database.dart';
import 'package:sparkplugzapp/services/shared_pref.dart';

class SeeCart extends StatefulWidget {
  SeeCart({Key? key}) : super(key: key);

  @override
  _SeeCartState createState() => _SeeCartState();
}

class _SeeCartState extends State<SeeCart> {
  String userIdkey = "";
  late Stream orderStream;

  getMyInfoFromSharedPreference() async {
    userIdkey = await SharedPreferenceHelper().getUserId();
  }

  doThisOnLaunch() async {
    await getMyInfoFromSharedPreference();
    getAdminUsers();
  }

  getAdminUsers() async {
    orderStream = await DatabaseMethods().getOrder(userIdkey);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    doThisOnLaunch();
  }

  Widget orderSoon() {
    return StreamBuilder(
      stream: orderStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return SingleChildScrollView(
                    child: Card(
                        child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xFFD3D3D3), width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            width: 45.0,
                            height: 73.0,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    ds["Quantity"],
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Container(
                            height: 70.0,
                            width: 70.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      ds["image"],
                                    ),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(35.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 5.0,
                                      offset: Offset(0.0, 2.0))
                                ]),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  ds["description"],
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "Sub Total : \$" + ds["price"],
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.orangeAccent),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  ds["Delivery"],
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.orangeAccent),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                  );
                },
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Order Cart",
          style: TextStyle(color: Colors.black, fontFamily: 'Pacifico'),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: orderSoon(),
    );
  }
}
