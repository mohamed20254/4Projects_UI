import 'package:flutter/material.dart';
import 'package:fluttertest/travel%20mobile%20App/model/travil_model.dart';

class TravilDetils extends StatelessWidget {
  final TravelDestination data;
  const TravilDetils({super.key, required this.data});

  @override
  Widget build(final BuildContext context) {
    final ValueNotifier<int> cureentindex = ValueNotifier(0);
    final Size size = MediaQuery.of(context).size;
    final ValueNotifier<int> tapIndex = ValueNotifier(0);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: const Icon(Icons.arrow_back_ios, size: 22),
        title: const Text(
          "Detils page",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8),
            child: Icon(Icons.api_sharp, size: 22),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: size.height * 0.55,
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.grey.shade500,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 5),
                    spreadRadius: 7,
                    blurRadius: 4,
                    color: Colors.grey.shade500,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    PageView.builder(
                      onPageChanged: (final value) {
                        cureentindex.value = value;
                      },
                      itemCount: data.image!.length,
                      itemBuilder: (final context, final index) {
                        return Image.network(
                          data.image![index],
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 180,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ValueListenableBuilder(
                                  valueListenable: cureentindex,
                                  builder:
                                      (
                                        final context,
                                        final value,
                                        final child,
                                      ) => Container(
                                        margin: const EdgeInsets.only(right: 8),
                                        height: 85,
                                        width: 85,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image:
                                                data.image!.length - 1 == value
                                                    ? NetworkImage(
                                                      data.image![0],
                                                    )
                                                    : NetworkImage(
                                                      data.image![value + 1],
                                                    ),
                                          ),
                                        ),
                                      ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black,
                                      Colors.black,
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: List.generate(
                                        data.image!.length,
                                        (final index) {
                                          return ValueListenableBuilder(
                                            valueListenable: cureentindex,
                                            builder:
                                                (
                                                  final context,
                                                  final value,
                                                  final child,
                                                ) => AnimatedContainer(
                                                  margin: const EdgeInsets.only(
                                                    right: 5,
                                                  ),

                                                  height: 7,
                                                  width:
                                                      value == index ? 35 : 25,
                                                  duration: const Duration(
                                                    microseconds: 400,
                                                  ),

                                                  decoration: BoxDecoration(
                                                    color:
                                                        value == index
                                                            ? Colors.white
                                                            : Colors.grey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          12,
                                                        ),
                                                  ),
                                                ),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Text(
                                          data.name,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        const Spacer(),
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 20,
                                        ),
                                        Text(
                                          data.rate.toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),

                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        Text(
                                          data.location,
                                          style: const TextStyle(
                                            color: Colors.white60,
                                            fontSize: 12,
                                          ),
                                        ),
                                        const Spacer(),
                                        const Text(
                                          "(136 review)",
                                          style: TextStyle(
                                            color: Colors.white60,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.54,
                      child: const TabBar(
                        labelColor: Colors.blueAccent,
                        labelStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        unselectedLabelColor: Colors.black,
                        indicatorColor: Colors.blueAccent,
                        dividerColor: Colors.transparent,
                        tabs: [Tab(text: 'Overview'), Tab(text: 'Review')],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              data.description,
                              maxLines: 3,
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                height: 1.5,
                              ),
                            ),
                          ),
                          const Center(child: Text('No Review yet')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 110,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Price", style: TextStyle(fontSize: 16)),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '\$${data.price}',
                          style: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue,
                          ),
                        ),
                        TextSpan(
                          text: ' / Person',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black,
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.confirmation_number_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Add to Cart",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> tapReview = ["OverView", "Review"];
