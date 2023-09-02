import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_cart/view/login.dart';
import 'package:shopping_cart/view/product_list.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    islogin();
  }

  islogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool Islogin = sp.getBool('islogin') ?? false;
    String mail = sp.getString('email') ?? '';
    String fname = sp.getString('firstname') ?? '';
    String lname = sp.getString('lastname') ?? '';
    if (Islogin) {
      Timer(Duration(seconds: 3), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Product_List(
                f_name: fname,
                l_name: lname,
                email: mail,
              ),
            ));
      });
    } else {
      Timer(Duration(seconds: 3), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image(image: AssetImage('images/cart.png'))),
          SizedBox(height: MediaQuery.of(context).size.height * .02),
          Center(
            child: Text(
              "Shopping Cart",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
