import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_cart/Utils/Mywidgets.dart';
import 'package:shopping_cart/Utils/colors.dart';
import 'package:shopping_cart/view/product_list.dart';
import 'package:shopping_cart/view/signup.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  height: MediaQuery.of(context).size.height * .1,
                ),
                Center(
                    child: Icon(
                  Icons.login_sharp,
                  size: MediaQuery.of(context).size.height * .1,
                  color: secondarycolor,
                )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                Center(
                    child: Text(
                  "Please, Login",
                  style: TextStyle(
                      fontSize: 24,
                      color: primarycolor,
                      fontFamily: 'p_font',
                      fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .06,
                ),
                TextFormField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email, color: primarycolor),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      hintText: 'email',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primarycolor),
                          borderRadius: BorderRadius.circular(4))),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .04,
                ),
                TextFormField(
                  obscureText: true,
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
                  height: MediaQuery.of(context).size.height * .06,
                ),
                Mybutton(
                    buttonclr: secondarycolor,
                    buttontext: 'Login',
                    onpress: () async {
                      SharedPreferences sp =
                          await SharedPreferences.getInstance();
                      String fname = sp.getString('firstname') ?? '';
                      String lname = sp.getString('lastname') ?? '';
                      String email = sp.getString('e_mail') ?? '';
                      String password = sp.getString('pass_word') ?? '';
                      bool iscreated = sp.getBool('iscreated') ?? false;
                      sp.setString('email', emailcontroller.text);
                      sp.setString('password', passwordcontroller.text);
                      sp.setBool('islogin', true);

                      if (sp.getString('email')!.isNotEmpty &&
                          sp.getString('password')!.isNotEmpty &&
                          iscreated == true &&
                          sp.getString('email') == email &&
                          sp.getString('password') == password) {
                        print('login successfully');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Product_List(
                                  f_name: fname,
                                  l_name: lname,
                                  email: emailcontroller.text.toString()),
                            ));
                      } else {
                        print("PLease try again");
                      }
                    }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .06,
                ),
                Container(
                  color: Colors.grey,
                  height: 1,
                  width: 200,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("don't have account? "),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Signup_Screen(),
                            ));
                      },
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                            color: secondarycolor, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
