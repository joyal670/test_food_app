// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:test_app/core/dims/dims.dart';

import '../core/colors/colors.dart';

enum RadioButtonValue { OneInch, TwoInch, ThreeInch }

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  RadioButtonValue _radio = RadioButtonValue.OneInch;
  final qty = TextFormField();
  ProductDetailsModel productDetailsModel = ProductDetailsModel(
      pname: "Melting Cheese",
      pPrice: 9.47,
      pImage: "",
      pQty: 1,
      pRating: 4.9,
      pCalories: 44,
      pPrepTime: "20 - 30 min",
      pTotal: 0,
      isFav: false);

  @override
  void initState() {
    final total = productDetailsModel.pQty * productDetailsModel.pPrice;
    productDetailsModel.pTotal = total;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final total = productDetailsModel.pQty * productDetailsModel.pPrice;
    // productDetailsModel.pTotal = total;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  if (productDetailsModel.isFav) {
                    productDetailsModel.isFav = false;
                  } else {
                    productDetailsModel.isFav = true;
                  }
                });
              },
              icon: productDetailsModel.isFav
                  ? Icon(
                      Icons.favorite,
                      color: colorRed,
                    )
                  : Icon(
                      Icons.favorite_outline,
                      color: colorBlack,
                    )),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Added to Cart")));
            },
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colorPink),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)))),
            child: Text(
              'ADD TO CART',
              style: TextStyle(color: colorWhite),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                productDetailsModel.pname,
                style: TextStyle(
                    color: colorGrey,
                    fontSize: 21,
                    fontWeight: FontWeight.w600),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '\$',
                    style: TextStyle(
                        color: colorRed,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '${productDetailsModel.pPrice}',
                    style: TextStyle(
                        color: colorGrey,
                        fontSize: 21,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Image.asset('assets/images/Pizza.png'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (productDetailsModel.pQty <= 1) {
                          productDetailsModel.pQty = 1;
                        } else {
                          productDetailsModel.pQty--;
                        }

                        productDetailsModel.pTotal = productDetailsModel.pQty *
                            productDetailsModel.pPrice;
                        print(productDetailsModel.pTotal);
                      });
                    },
                    icon: Icon(
                      Icons.remove,
                      color: colorWhite,
                    ),
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                      backgroundColor: MaterialStatePropertyAll(colorPink),
                    ),
                  ),
                  width15,
                  Text(
                    '${productDetailsModel.pQty}',
                    style: TextStyle(
                        color: colorBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  width15,
                  IconButton(
                    onPressed: () {
                      setState(() {
                        productDetailsModel.pQty++;
                        productDetailsModel.pTotal = productDetailsModel.pQty *
                            productDetailsModel.pPrice;
                        print(productDetailsModel.pTotal);
                      });
                    },
                    icon: Icon(
                      Icons.add,
                      color: colorWhite,
                    ),
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                        backgroundColor: MaterialStatePropertyAll(colorPink)),
                  ),
                ],
              ),
              height10,
              Text(
                '\$ ${productDetailsModel.pTotal}',
                style: TextStyle(
                    color: colorBlack,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              height25,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Radio(
                        value: RadioButtonValue.OneInch,
                        groupValue: _radio,
                        onChanged: (RadioButtonValue? value) {
                          setState(() {
                            //  productDetailsModel.pTotal + 6.44;
                            _radio = value!;

                            productDetailsModel.pTotal =
                                productDetailsModel.pTotal + 6.44;
                          });
                        },
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          return colorPink;
                        }),
                        activeColor: colorPink,
                      ),
                      Text(
                        '\$6.44',
                        style: TextStyle(
                            color: colorLightGrey,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '8 inch',
                        style: TextStyle(
                            color: colorBlack,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Radio(
                        value: RadioButtonValue.TwoInch,
                        groupValue: _radio,
                        onChanged: (RadioButtonValue? value) {
                          setState(() {
                            _radio = value!;

                            productDetailsModel.pTotal =
                                productDetailsModel.pTotal + 9.47;
                          });
                        },
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          return colorPink;
                        }),
                        activeColor: colorPink,
                      ),
                      Text(
                        '\$9.47',
                        style: TextStyle(
                            color: colorLightGrey,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '12 inch',
                        style: TextStyle(
                            color: colorBlack,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Radio(
                        value: RadioButtonValue.ThreeInch,
                        groupValue: _radio,
                        onChanged: (RadioButtonValue? value) {
                          setState(() {
                            _radio = value!;

                            productDetailsModel.pTotal =
                                productDetailsModel.pTotal + 15.32;
                          });
                        },
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          return colorPink;
                        }),
                        activeColor: colorPink,
                      ),
                      Text(
                        '\$15.32',
                        style: TextStyle(
                            color: colorLightGrey,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '16 inch',
                        style: TextStyle(
                            color: colorBlack,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ],
              ),
              height25,
              ProductInfoWidget(
                model: productDetailsModel,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductInfoWidget extends StatelessWidget {
  ProductInfoWidget({super.key, required this.model});

  ProductDetailsModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              'assets/images/Star.png',
              width: 25,
              height: 25,
            ),
            width5,
            Text(
              model.pRating.toString(),
              style: TextStyle(
                  color: colorBlack, fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Row(
          children: [
            Image.asset(
              'assets/images/Emoji.png',
              width: 25,
              height: 25,
            ),
            width5,
            Text(
              '${model.pCalories} Calories',
              style: TextStyle(
                  color: colorBlack, fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Row(
          children: [
            Image.asset(
              'assets/images/Time.png',
              width: 25,
              height: 25,
            ),
            width5,
            Text(
              model.pPrepTime,
              style: TextStyle(
                  color: colorBlack, fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        )
      ],
    );
  }
}

class ProductDetailsModel {
  String pname;
  double pPrice;
  String pImage;
  int pQty;
  double pRating;
  int pCalories;
  String pPrepTime;
  double pTotal;
  bool isFav;

  ProductDetailsModel(
      {required this.pname,
      required this.pPrice,
      required this.pImage,
      required this.pQty,
      required this.pRating,
      required this.pCalories,
      required this.pPrepTime,
      required this.pTotal,
      required this.isFav});
}
