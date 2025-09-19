import 'package:flutter/material.dart';
import 'package:fluttertest/burger_app/model.dart';

class BurgersDetils extends StatelessWidget {
  const BurgersDetils({super.key, required this.burger});
  final Burger burger;

  @override
  Widget build(final BuildContext context) {
    final ValueNotifier<int> _count = ValueNotifier<int>(1);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: ValueListenableBuilder(
        valueListenable: _count,
        builder: (final context, final value, final child) {
          return FloatingActionButton.extended(
            backgroundColor: Colors.white,
            onPressed: () {},
            label: Row(
              children: [
                const Text(
                  "\$",
                  style: TextStyle(color: Colors.amber, fontSize: 19),
                ),
                Text(
                  "${burger.price * value}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 40),
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text(
                    "Add to cart",
                    style: TextStyle(
                      letterSpacing: 1.3,
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_ios_new),
                  ),
                  const Text(
                    "Details",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border_rounded),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Center(
                child: Hero(
                  tag: burger.image,
                  child: Image.network(burger.image, height: size.height * 0.3),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(1),
                height: 20,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 17),
                    const SizedBox(width: 2),
                    Text(
                      burger.rating.toString(),
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        burger.name,
                        style: const TextStyle(
                          fontSize: 26,
                          height: 1.3,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1,
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 40,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.grey.shade300,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              _count.value++;
                            },
                            child: const Text(
                              "+",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          ValueListenableBuilder(
                            valueListenable: _count,
                            builder:
                                (context, value, child) => Text(
                                  value.toString(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                          ),
                          InkWell(
                            onTap: () {
                              if (_count.value > 0) {
                                _count.value--;
                              }
                            },
                            child: const Text(
                              "-",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "ingredients",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ingredaints(text1: "🧀", text2: "Cheese"),

                    ingredaints(text1: "🧅", text2: "Onion"),
                    ingredaints(text1: "🥦", text2: "Vegetables"),
                    ingredaints(text1: "🍅", text2: "Tomato"),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Description",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Text(
                      burger.description,
                      style: const TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card ingredaints({required final String text1, required final String text2}) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              text1,
              // ignore: prefer_const_constructors
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              text2,
              style: const TextStyle(color: Colors.black45, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
