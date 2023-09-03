import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:shopping_cart/Utils/Mywidgets.dart';
import 'package:shopping_cart/Utils/colors.dart';

class Detail_Screen extends StatefulWidget {
  final String product_name, product_Images, product_price, product_units;

  Detail_Screen(
      {Key? key,
      required this.product_Images,
      required this.product_name,
      required this.product_price,
      required this.product_units});

  @override
  State<Detail_Screen> createState() => _Detail_ScreenState();
}

class _Detail_ScreenState extends State<Detail_Screen> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: secondarycolor,
        //   title: Text("Product Detail"),
        //   centerTitle: true,
        // ),
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Image(
                        height: MediaQuery.of(context).size.height * .4,
                        image: NetworkImage(widget.product_Images.toString()))),
                // Container(
                //   color: Colors.grey,
                //   height: 1,
                //   width: double.infinity,
                // ),

                // Padding(
                //   padding: const EdgeInsets.all(0),
                //   child: Divider(),
                // ),
                SizedBox(height: MediaQuery.of(context).size.height * .04),

                //Detail container for lower detail of the product
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.product_name.toString(),
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.favorite_border_outlined,
                              color: secondarycolor,
                            ),
                          ],
                        ),
                        Text(
                          widget.product_units.toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * .05),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: primarycolor.withOpacity(.2)),
                                    color: Colors.transparent),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          count--;
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.remove,
                                          color: primarycolor,
                                        ),
                                      ),
                                      Text(
                                        count.toString(),
                                        style: TextStyle(color: secondarycolor),
                                      ),
                                      InkWell(
                                          onTap: () {
                                            count++;
                                            setState(() {});
                                          },
                                          child: Icon(Icons.add,
                                              color: primarycolor))
                                    ],
                                  ),
                                )),
                            Text(
                              "Rs. " + widget.product_price.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * .02),
                        Divider(),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * .02),
                        Text("Product Detail",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * .005),
                        ReadMoreText(
                          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.",
                          trimMode: TrimMode.Line,
                          trimLines: 3,
                          lessStyle: TextStyle(
                              color: Colors.black.withOpacity(.8),
                              fontWeight: FontWeight.bold),
                          moreStyle: TextStyle(
                              color: Colors.black.withOpacity(.8),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * .04),
                        Mybutton(
                            buttontext: "Add to cart",
                            onpress: () {},
                            buttonclr: secondarycolor)
                      ],
                    ),
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
