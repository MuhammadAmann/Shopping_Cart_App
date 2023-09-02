import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_cart/Utils/colors.dart';
import 'package:shopping_cart/view/cart_list.dart';
import 'package:shopping_cart/view/login.dart';

class Product_List extends StatefulWidget {
  dynamic email, f_name, l_name;
  Product_List(
      {super.key,
      required this.email,
      required this.f_name,
      required this.l_name});
  @override
  State<Product_List> createState() => _Product_ListState();
}

class _Product_ListState extends State<Product_List> {
  var count = 3;
  List<String> productname = [
    "Mango",
    "Banan",
    "Apple",
    "Pineapple",
    "Strawberry",
    "Grapes",
    "Annar",
    "Orange",
    "Mixed Fruit Basket"
  ];
  List<String> productunits = [
    "Kg",
    "Dozen",
    "Kg",
    "Kg",
    "Kg",
    "Kg",
    "Kg",
    "Dozen",
    "Kg"
  ];
  List<String> productprice = [
    "120",
    "80",
    "150",
    "190",
    "70",
    "130",
    "90",
    "300",
    "450"
  ];
  List<String> productImages = [
    "https://img.freepik.com/free-photo/mango-peeled-cut-into-squares_1220-247.jpg?size=626&ext=jpg&uid=R27160915&ga=GA1.2.438186149.1689966725&semt=ais",
    "https://img.freepik.com/free-photo/yellow-banana-fruit_1203-7489.jpg?w=740&t=st=1693477621~exp=1693478221~hmac=571a6783faba179f3c5b8113ef538a37f51a80bc5d14fa4b7361ca9ebd4289eb",
    "https://img.freepik.com/free-photo/close-up-fresh-apple_144627-14640.jpg?size=626&ext=jpg&uid=R27160915&ga=GA1.2.438186149.1689966725&semt=sph",
    "https://img.freepik.com/free-photo/pineapple-fruit_1203-7746.jpg?size=626&ext=jpg&uid=R27160915&ga=GA1.1.438186149.1689966725&semt=sph",
    "https://img.freepik.com/free-photo/closeup-shot-fresh-ripe-strawberries-isolated-white-surface_181624-54939.jpg?size=626&ext=jpg&uid=R27160915&ga=GA1.1.438186149.1689966725&semt=sph",
    "https://img.freepik.com/free-photo/green-red-grape-isolated-white_1232-1957.jpg?size=626&ext=jpg&uid=R27160915&ga=GA1.2.438186149.1689966725&semt=sph",
    "https://img.freepik.com/free-photo/exotic-delicious-pomegranate-white-background_144627-12571.jpg?size=626&ext=jpg&uid=R27160915&ga=GA1.1.438186149.1689966725&semt=sph",
    "https://img.freepik.com/free-photo/orange-white-white_144627-16571.jpg?size=626&ext=jpg&uid=R27160915&ga=GA1.2.438186149.1689966725&semt=sph",
    "https://img.freepik.com/free-photo/fruits-basket_1339-4556.jpg?size=626&ext=jpg&uid=R27160915&ga=GA1.2.438186149.1689966725&semt=ais"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondarycolor,
        centerTitle: true,
        title: Text("Product List"),
        actions: [
          Center(
            child: Badge(
              backgroundColor: primarycolor,
              label: Text(count.toString()),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Cart_List(),
                      ));
                },
                child: Icon(
                  Icons.shopping_bag,
                  size: 26,
                ),
              ),
            ),
          ),
          SizedBox(width: 16)
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: primarycolor),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1544723795-3fb6469f5b39?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1378&q=80'),
                ),
                accountName: Text(widget.f_name + widget.l_name),
                accountEmail: Text(widget.email)),
            ListTile(
              leading: Icon(Icons.shopping_bag_outlined),
              title: Text("Cart List"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cart_List(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Log out"),
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                
                sp.clear();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Expanded(
              child: ListView.builder(
            itemCount: productname.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image(
                                height: 90,
                                width: 90,
                                image: NetworkImage(
                                    productImages[index].toString())),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .02,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    productname[index].toString(),
                                    style: TextStyle(
                                        fontFamily: 'sfpro_font',
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              .02),
                                  Text(
                                    "Rs. " +
                                        productprice[index].toString() +
                                        "/" +
                                        productunits[index].toString(),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                count++;
                                setState(() {});
                              },
                              child: Container(
                                height: 35,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: primarycolor,
                                    borderRadius: BorderRadius.circular(6)),
                                child: Center(
                                    child: Text(
                                  "Add to cart",
                                  style: TextStyle(color: textcolor),
                                )),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}
