import 'package:flutter/material.dart';
import 'package:fluttertest/food_recipe_app/model/recipe_mode.dart';
import 'package:fluttertest/food_recipe_app/presentation/ietems_details_screen.dart';

class HomeScreenRecipe extends StatelessWidget {
  HomeScreenRecipe({super.key});
  final ValueNotifier<int> slectedIndex = ValueNotifier<int>(0);
  final ValueNotifier<int> slectedpage = ValueNotifier<int>(0);
  final List iconlist = [
    Icons.home_filled,
    Icons.bar_chart_rounded,
    Icons.favorite_border_outlined,
    Icons.person_4_outlined,
  ];
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //=========================headers=============================
              headerParts(),
              const SizedBox(),

              const SizedBox(height: 20),
              //==============================search====================
              mySearch(),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Menus",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "see all",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              popularmenuItems(slectedIndex),
              const SizedBox(height: 10),
              mycardrecipe(context),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Catocaries ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(color: Colors.green, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              catogerisitem(),
              const SizedBox(height: 10),
              const Row(
                children: [
                  SizedBox(height: 20),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/mohamed.jpg"),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mohamed Fawzy",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Expert chef",
                        style: TextStyle(color: Colors.black38, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 50,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Color.fromARGB(161, 255, 255, 255), blurRadius: 1),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(iconlist.length, (final index) {
            return ValueListenableBuilder(
              valueListenable: slectedpage,
              builder:
                  (final context, final value, final child) => GestureDetector(
                    onTap: () {
                      slectedpage.value = index;
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          iconlist[index],
                          size: 30,
                          color: value == index ? Colors.green : Colors.grey,
                        ),
                        value == index
                            ? Container(
                              height: 3,
                              width: 20,
                              color: Colors.green,
                            )
                            : const SizedBox(),
                      ],
                    ),
                  ),
            );
          }),
        ),
      ),
    );
  }

  SingleChildScrollView catogerisitem() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(recipeCategory.length, (final index) {
          final recip = recipeCategory[index];
          return Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: recip.color,
                  child: Image.asset(recip.image, height: 40, width: 40),
                ),
                Text(
                  recip.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  SizedBox mycardrecipe(final BuildContext context) {
    return SizedBox(
      height: 260,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(recipeItemsList.length, (final index) {
            final recipe = recipeItemsList[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IetemsDetailsScreen(data: recipe),
                  ),
                );
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width / 2.45,
                margin: const EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(recipe.image),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: recipe.fav ? Colors.red : Colors.black38,
                      ),
                      child: const Icon(
                        size: 15,
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  maxLines: 1,
                                  recipe.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 10,
                                  ),
                                  Text(
                                    recipe.rate.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 3),

                          Text(
                            "it bowl ${recipe.weight}g",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white70,
                              height: 0,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            "${recipe.calorie} Kkal | 25% akl",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white70,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  SizedBox popularmenuItems(final ValueNotifier<int> slectedIndex) {
    return SizedBox(
      height: 40,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: List.generate(
          menuItem.length,
          (final index) => ValueListenableBuilder(
            valueListenable: slectedIndex,
            builder:
                (final context, final value, final child) => GestureDetector(
                  onTap: () {
                    slectedIndex.value = index;
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          value == index ? Colors.green : Colors.white,
                          value == index ? Colors.greenAccent : Colors.white,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Text(
                      menuItem[index],
                      style: TextStyle(
                        color: value == index ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
          ),
        ),
      ),
    );
  }

  Container mySearch() {
    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        color: const Color.fromARGB(31, 121, 120, 120),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10),
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyle(
            color: Colors.black26,
            fontWeight: FontWeight.bold,
          ),
          prefixIcon: Icon(Icons.search_rounded, color: Colors.black26),
        ),
      ),
    );
  }

  Row headerParts() {
    return const Row(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Hello Mohamed\n",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              TextSpan(
                text: "what do you want to eat today?",
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),
        Spacer(),
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/avatar.jpg"),
          radius: 20,
        ),
      ],
    );
  }
}
