import 'package:coffee/models/product_model.dart';
import 'package:coffee/models/size_options_model.dart';
import 'package:coffee/screen/widget/background.dart';
import 'package:coffee/screen/widget/displayImage.dart';
import 'package:coffee/screen/widget/sizeOptionItems.dart';
import 'package:flutter/material.dart';

import '../models/colors.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.product});

  final Product product;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int selectedSize = 2;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppbar(context),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const BackGround(),
            Positioned(
                top: 20,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                        tag: widget.product.name,
                        child: SizedBox(
                          width: size.width * 0.81,
                          height: size.height * 0.5,
                          child: DisplayImage(product: widget.product),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: size.width / 1.5,
                          child: Text(
                            widget.product.name,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              "\$${widget.product.price}.0",
                              style: const TextStyle(
                                  fontSize: 22,
                                  color: thirdColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "Best Sales",
                              style: TextStyle(fontSize: 13, color: Colors.grey),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
        
                      children: [
                        Text(
                          "Size Option",
                          style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                            children: List.generate(sizeOptions.length, (index) {
                              return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedSize = index;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 25),
                                    child: SizeOptionItems(
                                      index: index,
                                      sizeOption: sizeOptions[index],
                                      selected: selectedSize == index ? true : false,
                                    ),
                                  ));
                            }))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (quantity > 1) {
                                    quantity--;
                                  }
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                    color: secondColor, shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.remove,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              quantity.toString(),
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                    color: secondColor, shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 90,
                        ),
                        Container(
                          width: 150,
                          height: 60,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            color: thirdColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              "Add to Order",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
        
                      ],
                    ),
                    const SizedBox(height: 5,)
                  ],
                )),
          ],
        ),
      ),
    );
  }

  AppBar MyAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
      title: const Text(
        "Details",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
      ),
      centerTitle: true,
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

