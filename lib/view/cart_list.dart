import 'package:flutter/material.dart';
import 'package:shopping_cart/Utils/colors.dart';
import 'package:shopping_cart/view/detail_Screen.dart';

class Cart_List extends StatefulWidget {
  final List<String> p_image, p_name, p_unit, p_price;
  final int count;
  Cart_List(
      {Key? key,
      required this.count,
      required this.p_image,
      required this.p_name,
      required this.p_price,
      required this.p_unit});

  @override
  State<Cart_List> createState() => _Cart_ListState();
}

class _Cart_ListState extends State<Cart_List> {
  int p_count = 1;

  //   "https://img.freepik.com/free-photo/mango-peeled-cut-into-squares_1220-247.jpg?size=626&ext=jpg&uid=R27160915&ga=GA1.2.438186149.1689966725&semt=ais",
  //   "https://img.freepik.com/free-photo/yellow-banana-fruit_1203-7489.jpg?w=740&t=st=1693477621~exp=1693478221~hmac=571a6783faba179f3c5b8113ef538a37f51a80bc5d14fa4b7361ca9ebd4289eb",
  //   "https://img.freepik.com/free-photo/close-up-fresh-apple_144627-14640.jpg?size=626&ext=jpg&uid=R27160915&ga=GA1.2.438186149.1689966725&semt=sph",
  //   "https://img.freepik.com/free-photo/pineapple-fruit_1203-7746.jpg?size=626&ext=jpg&uid=R27160915&ga=GA1.1.438186149.1689966725&semt=sph",
  //   "https://img.freepik.com/free-photo/closeup-shot-fresh-ripe-strawberries-isolated-white-surface_181624-54939.jpg?size=626&ext=jpg&uid=R27160915&ga=GA1.1.438186149.1689966725&semt=sph",
  //   "https://img.freepik.com/free-photo/green-red-grape-isolated-white_1232-1957.jpg?size=626&ext=jpg&uid=R27160915&ga=GA1.2.438186149.1689966725&semt=sph",
  //   "https://img.freepik.com/free-photo/exotic-delicious-pomegranate-white-background_144627-12571.jpg?size=626&ext=jpg&uid=R27160915&ga=GA1.1.438186149.1689966725&semt=sph",
  //   "https://img.freepik.com/free-photo/orange-white-white_144627-16571.jpg?size=626&ext=jpg&uid=R27160915&ga=GA1.2.438186149.1689966725&semt=sph",
  //   "https://img.freepik.com/free-photo/fruits-basket_1339-4556.jpg?size=626&ext=jpg&uid=R27160915&ga=GA1.2.438186149.1689966725&semt=ais"
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondarycolor,
        title: Text('Cart List'),
        centerTitle: true,
        actions: [
          Center(
            child: Badge(
              backgroundColor: primarycolor,
              label: Text(widget.count.toString()),
              child: Icon(
                Icons.shopping_bag,
                size: 26,
              ),
            ),
          ),
          SizedBox(
            width: 16,
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Expanded(
              child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return InkWell(
                // onTap: () {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => Detail_Screen(
                //                                   product_Images: productImages[index].toString(),
                //                 product_name: productname[index].toString(),
                //                 product_price: productprice[index].toString(),
                //                 product_units: productunits[index].toString(),
                //       )));
                // },
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Detail_Screen(
                              product_Images: widget.p_image[index].toString(),
                              product_name: widget.p_name[index].toString(),
                              product_price: widget.p_price[index].toString(),
                              product_units: widget.p_unit[index].toString()),
                        ));
                  },
                  child: Card(
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
                                        widget.p_image[index].toString())),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .02,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.p_name[index].toString(),
                                        style: TextStyle(
                                            fontFamily: 'sfpro_font',
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .02),
                                      Text(
                                        "Rs. " +
                                            widget.p_price[index].toString() +
                                            "/" +
                                            widget.p_unit[index].toString(),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                    height: 35,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: primarycolor,
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              p_count--;
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              color: textcolor,
                                            ),
                                          ),
                                          Text(
                                            p_count.toString(),
                                            style: TextStyle(color: textcolor),
                                          ),
                                          InkWell(
                                              onTap: () {
                                                p_count++;
                                                setState(() {});
                                              },
                                              child: Icon(Icons.add,
                                                  color: textcolor))
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          )),
          Container(
            color: textcolor,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Total price ",
                    style: TextStyle(
                        color: secondarycolor,
                        fontFamily: 'sfpro_font',
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Text("Rs. 350.00",
                      style: TextStyle(
                          color: secondarycolor,
                          fontFamily: 'sfpro_font',
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
