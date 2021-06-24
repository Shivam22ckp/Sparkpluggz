import 'package:flutter/material.dart';
import 'package:sparkplugzapp/pages/bottomnavigation.dart';
import 'package:sparkplugzapp/services/database.dart';
import 'package:sparkplugzapp/services/shared_pref.dart';

class AddressPage extends StatefulWidget {
  AddressPage({Key? key}) : super(key: key);

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController useraddresseditingController =
      new TextEditingController();
  TextEditingController userPhoneeditingController =
      new TextEditingController();
  String userName = "", userEmail = "", userPic = "";
  getMyInfoFromSharedPreference() async {
    userName = await SharedPreferenceHelper().getDisplayName();
    userPic = await SharedPreferenceHelper().getUserProfileUrl();
    userEmail = await SharedPreferenceHelper().getUserEmail();
  }

  doThisOnLaunch() async {
    await getMyInfoFromSharedPreference();
  }

  addMessage(bool clicked) {
    if (useraddresseditingController.text != "" &&
        userPhoneeditingController.text != "") {
      String Address = useraddresseditingController.text;
      String Phone = userPhoneeditingController.text;
      SharedPreferenceHelper().saveUserAddress(Address);
      SharedPreferenceHelper().saveUserPhone(Phone);
      Map<String, dynamic> addressInfoMap = {
        "Address": Address,
        "Phone": Phone,
        "ProfileUrl": userPic,
        "email": userEmail,
        "name": userName,
      };
      DatabaseMethods().addMessage(addressInfoMap).then((value) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => BottomNavigation()));
      });
    }
  }

  @override
  void initState() {
    doThisOnLaunch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
            decoration: BoxDecoration(
          gradient: new LinearGradient(
            colors: [Colors.pink, Colors.lightGreenAccent],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        )),
        title: Text(
          "Sparkpluggz",
          style: TextStyle(
              color: Colors.white, fontSize: 30.0, fontFamily: 'Pacifico'),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 40.0,
                ),
                Text(
                  "Address",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(24)),
                  child: Expanded(
                    child: (TextField(
                      controller: useraddresseditingController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Your Address",
                      ),
                    )),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Phone",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(24)),
                  child: Expanded(
                    child: (TextField(
                      controller: userPhoneeditingController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Your Phone Number",
                      ),
                    )),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    addMessage(true);
                  },
                  child: Text(
                    "Ok",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
