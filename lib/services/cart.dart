import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:sparkplugzapp/home.dart';
import 'package:sparkplugzapp/pages/addcart.dart';
import 'package:sparkplugzapp/pages/successful_order.dart';
import 'package:sparkplugzapp/services/database.dart';
import 'package:sparkplugzapp/services/shared_pref.dart';

class Cart extends StatefulWidget {
  String image, description;
  int price;

  Cart({required this.description, required this.image, required this.price});

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  late String userIdkey, userName, userAddress, userPhone;
  late int cartquantity = 1,
      originalprice = widget.price,
      carttotal = widget.price;
  String orderId = "";

  getMyInfoFromSharedPreference() async {
    userIdkey = await SharedPreferenceHelper().getUserId();
    userName = await SharedPreferenceHelper().getDisplayName();
    userAddress = await SharedPreferenceHelper().getUserAddress();
    userPhone = await SharedPreferenceHelper().getUserPhone();
  }

  doThisOnLaunch() async {
    await getMyInfoFromSharedPreference();
  }

  @override
  void initState() {
    doThisOnLaunch();
    super.initState();
  }

  addOrder(bool sendclicked) {
    if (sendclicked == true) {
      if (orderId == "") {
        orderId = randomAlphaNumeric(12);
      }
      Map<String, dynamic> orderInfoMap = {
        "description": widget.description,
        "image": widget.image,
        "Price": originalprice,
        "Quantity": "$cartquantity",
        "price": "$carttotal",
        "Name": userName,
        "Address": userAddress,
        "Phone": userPhone,
        "id": userIdkey,
        "orderid": orderId,
        "Delivery": "Yet to be delivered"
      };
      DatabaseMethods().addtoAdminOrder(orderInfoMap).then((value) {
        DatabaseMethods()
            .addtoOrder(userIdkey, orderId, orderInfoMap)
            .then((value) {
          orderId = "";
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => SuccessfulOrder()));
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 300, width: 400, child: Image.asset(widget.image)),
            SizedBox(
              height: 10.0,
            ),
            Text(
              widget.description,
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "\$$originalprice",
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.orangeAccent),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Text(
                  "Quantity",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFD3D3D3), width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  width: 45.0,
                  height: 73.0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: Column(
                      children: <Widget>[
                        InkWell(
                            onTap: () {
                              cartquantity = cartquantity + 1;

                              carttotal = carttotal + originalprice;
                              setState(() {});
                            },
                            child: Icon(Icons.keyboard_arrow_up,
                                color: Color(0xFFD3D3D3))),
                        Text(
                          "$cartquantity",
                          style: TextStyle(fontSize: 18.0, color: Colors.grey),
                        ),
                        InkWell(
                            onTap: () {
                              if (cartquantity > 0) {
                                cartquantity = cartquantity - 1;
                                carttotal = carttotal - originalprice;
                                setState(() {});
                              }
                            },
                            child: Icon(Icons.keyboard_arrow_down,
                                color: Color(0xFFD3D3D3))),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                Text(
                  "Total Price :  " + "\$$carttotal",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
                SizedBox(
                  width: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    addOrder(true);
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Place Order",
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
