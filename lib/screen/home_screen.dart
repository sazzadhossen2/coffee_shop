import 'dart:math';

import 'package:coffee/models/colors.dart';
import 'package:coffee/models/product_model.dart';
import 'package:coffee/screen/widget/background.dart';
import 'package:coffee/screen/widget/category_items.dart';
import 'package:coffee/screen/widget/displayImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


import '../models/category_model.dart';
import 'details_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentCategory = 0;
  int currentProduct = 0;
  PageController? controller;
  double vewPoint = 0.5;
  double? pageOffset = 1;

  @override
  void initState() {
    controller = PageController(initialPage: 1, viewportFraction: vewPoint)
      ..addListener(() {
        setState(() {
          pageOffset = controller!.page;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Product> dataProduct = products
        .where((element) => element.category == categories[currentCategory])
        .toList();
    return Scaffold(
      appBar: myAppbar(),
      body: Stack(
        children: [
          const BackGround(),
          const Positioned(
              top: 30,
              left: 40,
              child: Text(
                "Smooth out\nYour Everyday",
                style: TextStyle(
                    fontSize: 35, height: 1.2, fontWeight: FontWeight.w900),
              )),
          Positioned(
              top: 120,
              child: ClipPath(
                clipper: Clip(),
                child: Container(
                  height: 190,
                  width: size.width,
                  color: firstColor,
                  child: Row(
                      children: List.generate(
                          categories.length,
                          (index) => Expanded(
                                child: Container(
                                  height: 190,
                                  width: 107,
                                  color: currentCategory == index
                                      ? Colors.amber
                                      : Colors.transparent,
                                ),
                              ))),
                ),
              )),
          Positioned(
            top: 125,
            child: ClipPath(
              clipper: Clip(),
              child: Container(
                height: 280,
                width: size.width,
                color: firstColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(categories.length, (index) {
                    int decress = 0;
                    int max = 1;
                    int bottomPadding = 1;

                    for (var i = 0; i < categories.length; i++) {
                      bottomPadding = index > max ? index - decress++ : index;
                    }
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentCategory = index;
                          dataProduct = products
                              .where((element) =>
                                  element.category ==
                                  categories[currentCategory])
                              .toList();
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 10,
                          bottom: bottomPadding.abs() * 75,
                        ),
                        child: CategoryItems(
                          category: categories[index],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: ClipPath(
                clipper: Clip(),
                child: Container(
                  height: size.height * 0.58,
                  width: size.width,
                  color: secondColor,
                ),
              )),
          Positioned(
              bottom: 0,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipPath(
                    clipper: Clip(),
                    child: Container(
                      color: Colors.transparent,
                      height: size.height * 0.58,
                      width: size.width,
                      child: PageView.builder(
                          controller: controller,
                          onPageChanged: (value) {
                            setState(() {
                              currentProduct = value % dataProduct.length;
                            });
                          },
                          itemBuilder: (context, index) {
                            double scale = max(vewPoint,
                                (1 - (pageOffset! - index).abs() + vewPoint));
                            double angle = 0.0;
                            final items =
                                dataProduct[index % dataProduct.length];
                            return GestureDetector(
                              onTap: () {
                                Get.to(()=>DetailsScreen(product:dataProduct[currentProduct % dataProduct.length]));
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 200 - (scale / 1.6 * 170),
                                ),
                                child: Transform.rotate(
                                  angle: angle * pi,
                                  child: Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      DisplayImage(
                                        product: items,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: size.width / 2,
                        child: Column(
                          children: [
                            Text(
                              dataProduct[currentProduct % dataProduct.length].name,
                              maxLines: 2,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                height: 1.5,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "\$${dataProduct[currentProduct % dataProduct.length].price.toStringAsFixed(2)}",
                              maxLines: 2,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),

                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                          children: List.generate(
                              dataProduct.length, (index) => indicator(index))),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }

  AnimatedContainer indicator(int index) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              width: 3,
              color: index == currentProduct
                  ? Colors.amberAccent
                  : Colors.transparent)),
      padding: const EdgeInsets.all(10),
      child: Container(
        width: 6,
        height: 6,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == currentProduct ? Colors.white : Colors.white60),
      ),
    );
  }

  AppBar myAppbar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        children: [
          SvgPicture.asset(
            "assets/coffee-cup.svg",
            height: 30,
            color: Colors.amber,
          ),
          const SizedBox(
            width: 10,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Qahwa",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                "Space",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Center(
          child: Stack(
            children: [
              const Icon(
                Icons.shopping_cart,
                color: Colors.amber,
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  height: 8,
                  width: 8,
                  decoration:
                      const BoxDecoration(shape: BoxShape.circle, color: firstColor),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
