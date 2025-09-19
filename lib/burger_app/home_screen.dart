import 'package:flutter/material.dart';
import 'package:fluttertest/burger_app/burgers_detils.dart';
import 'package:fluttertest/burger_app/model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final ValueNotifier<int> slectedinde = ValueNotifier(0);

  @override
  Widget build(final BuildContext context) {
    final Size siz = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              offset: Offset(2, 3),
                            ),
                          ],
                        ),
                        child: const Center(child: Icon(Icons.menu_book)),
                      ),
                      Positioned(
                        right: 2,
                        top: 5,
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://th.bing.com/th/id/OIP.kKV0oI50dxfNtb08iF7CvQHaHa?o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3",
                    ),

                    radius: 20,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Finde and order", style: TextStyle(fontSize: 33)),
                      SizedBox(height: 5),
                      Text(
                        "burger for you 🍔",
                        style: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ),
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.black,
                  border: InputBorder.none,
                  hintText: "findy your burger",
                  hintStyle: const TextStyle(color: Colors.black38),
                  fillColor: Colors.black.withOpacity(0.1),
                  filled: true,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 35,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryList.length,
                  itemBuilder: (final context, final index) {
                    return GestureDetector(
                      onTap: () {
                        slectedinde.value = index;
                      },
                      child: ValueListenableBuilder(
                        valueListenable: slectedinde,
                        builder:
                            (final context, final value, final child) =>
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black26),

                                    // boxShadow: [BoxShadow(blurRadius: 1)],
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Center(
                                    child: Text(
                                      categoryList[index],
                                      style: TextStyle(
                                        letterSpacing: 2,
                                        color:
                                            value == index
                                                ? Colors.black
                                                : Colors.black45,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "Most popular",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              const SizedBox(height: 10),
              ValueListenableBuilder(
                valueListenable: slectedinde,
                builder: (final context, final value, final child) {
                  final List<Burger> datalist;
                  if (value == 0) {
                    datalist = beefBurgers;
                  } else if (value == 1) {
                    datalist = cheeseBurgers;
                  } else if (value == 3) {
                    datalist = shrimpBurgers;
                  } else {
                    datalist = pizzaBurgers;
                  }
                  return Visibility(
                    //  visible: value == 0 ? true : false,
                    child: SizedBox(
                      height: siz.height * 0.32,
                      width: siz.width,

                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: datalist.length,
                        itemBuilder: (final context, final index) {
                          final data = datalist[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder:
                                      // ignore: prefer_final_parameters
                                      (context) => BurgersDetils(burger: data),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(0.8),
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                padding: const EdgeInsets.all(0.8),
                                width: siz.width * 0.5,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 7,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.grey
                                            .withOpacity(0.3),
                                        child: Icon(
                                          Icons.favorite,
                                          color:
                                              data.isFav
                                                  ? Colors.red
                                                  : Colors.black54,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Hero(
                                          tag: data.image,
                                          child: Image.network(
                                            data.image,
                                            height: 120,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          data.name,
                                          maxLines: 1,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            Text(
                                              data.rating.toString(),
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.black45,
                                              ),
                                            ),
                                            Text(
                                              "| ${data.distance.toString()}",
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.black45,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 15),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "\$",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.amber,
                                              ),
                                            ),
                                            Text(
                                              data.price.toString(),
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
