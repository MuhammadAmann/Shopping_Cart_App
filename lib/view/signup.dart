import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_cart/Utils/Mywidgets.dart';
import 'package:shopping_cart/Utils/colors.dart';
import 'package:shopping_cart/view/login.dart';

class Signup_Screen extends StatefulWidget {
  const Signup_Screen({super.key});

  @override
  State<Signup_Screen> createState() => _Signup_ScreenState();
}

class _Signup_ScreenState extends State<Signup_Screen> {
  TextEditingController f_namecontroller = TextEditingController();
  TextEditingController l_nameontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .08,
              ),
              Icon(
                Icons.shopping_cart,
                size: 40,
                color: secondarycolor,
              ),
              Center(
                  child: Text(
                "Welcome!",
                style: TextStyle(
                    fontSize: 24, color: secondarycolor, fontFamily: 'p_font'),
              )),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              Center(
                  child: Text(
                "Create your account",
                style: TextStyle(
                    fontSize: 24,
                    color: primarycolor,
                    fontFamily: 'p_font',
                    fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: MediaQuery.of(context).size.height * .08,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: f_namecontroller,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          hintText: 'first name',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primarycolor),
                              borderRadius: BorderRadius.circular(4))),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * .03),
                  Expanded(
                    child: TextFormField(
                      controller: l_nameontroller,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          hintText: 'last name',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primarycolor),
                              borderRadius: BorderRadius.circular(4))),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              TextFormField(
                controller: emailcontroller,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: primarycolor,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    hintText: 'email',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primarycolor),
                        borderRadius: BorderRadius.circular(4))),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              TextFormField(
                controller: passwordcontroller,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: primarycolor,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    hintText: 'password',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primarycolor),
                        borderRadius: BorderRadius.circular(4))),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .04,
              ),
              Mybutton(
                  buttonclr: secondarycolor,
                  buttontext: "Create Account",
                  onpress: () async {
                    SharedPreferences sp =
                        await SharedPreferences.getInstance();
                    sp.setString('firstname', f_namecontroller.text);
                    sp.setString('lastname', l_nameontroller.text);
                    sp.setString('e_mail', emailcontroller.text);
                    sp.setString('pass_word', passwordcontroller.text);
                    sp.setBool('iscreated', true);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              Text("or"),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              Mybutton(
                  buttonclr: primarycolor,
                  buttontext: 'Login',
                  onpress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                  })
            ],
          ),
        ),
      ),
    ));
  }
}
