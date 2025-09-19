import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertest/food_recipe_app/model/recipe_mode.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class IetemsDetailsScreen extends StatelessWidget {
  const IetemsDetailsScreen({super.key, required this.data});
  final RecipItems data;

  @override
  Widget build(final BuildContext context) {
    final Size siz = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: siz.height,
        child: Stack(
          children: [
            Container(
              width: siz.width,
              height: siz.height * 0.55,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(data.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 20,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                  ),
                ),
                height: siz.height * 0.5,
                width: siz.width,

                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(
                            "assets/images/mohamed.jpg",
                          ),
                          radius: 20,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.wonername,
                                style: const TextStyle(fontSize: 16, height: 0),
                                maxLines: 1,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "12 recipes shared",
                                style: TextStyle(
                                  fontSize: 12,
                                  height: 0,
                                  color: Colors.black.withOpacity(0.6),
                                ),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              data.rate.toString(),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 5),
                            RatingBar.builder(
                              itemSize: 12,
                              initialRating: data.rate,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,

                              itemBuilder:
                                  (final context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                              onRatingUpdate: (rating) {},
                            ),
                            Text(
                              " ${data.review} Reviews",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              data.name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              "1 bowl (${data.weight}g)",
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Text(
                          "See details",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyProgressIndicatorValue(
                          name: "Carbs",
                          amount: "${data.carb} g",
                          percentage: "(56%)",
                          color: Colors.green,
                          data: 0.4,
                        ),
                        MyProgressIndicatorValue(
                          color: Colors.red,
                          name: 'Fat',
                          amount: '${data.fate} g',
                          percentage: '(72%)',
                          data: 0.6,
                        ),
                        MyProgressIndicatorValue(
                          color: Colors.orange,
                          name: 'Protein',
                          amount: '${data.protein} g',
                          percentage: '(8%)',
                          data: 0.2,
                        ),
                        MyProgressIndicatorValue(
                          color: Colors.green,
                          name: 'Calories',
                          amount: '${data.calorie} kkal',
                          percentage: "",
                          data: 0.7,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "ingredients",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "See details",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(recipeCategory.length, (
                          final index,
                        ) {
                          final recip = recipeCategory[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 14),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 24,
                                  backgroundColor: recip.color,
                                  child: Image.asset(
                                    recip.image,
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                                Text(
                                  recip.name,
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: siz.height * 0.5,
              child: ClipPath(
                clipper: Myclippath(),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: const BoxDecoration(color: Colors.white),
                ),
              ),
            ),
            Positioned(
              bottom: siz.height * 0.48,
              right: 30,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    const BoxShadow(color: Colors.white, spreadRadius: 5),
                  ],
                  color: data.fav ? Colors.red : Colors.black45,
                ),
                padding: const EdgeInsets.all(5),
                child: const Icon(Icons.favorite_outline, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyProgressIndicatorValue extends StatelessWidget {
  final String? name, amount;
  final String percentage;
  final Color color;
  final double data;
  const MyProgressIndicatorValue({
    super.key,
    required this.name,
    required this.amount,
    required this.percentage,
    required this.color,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 20,
      circularStrokeCap: CircularStrokeCap.round,
      percent: data,
      lineWidth: 7,
      reverse: true,
      backgroundColor: color.withOpacity(0.2),
      animation: true,
      animationDuration: 500,
      restartAnimation: true,
      progressColor: color,
      header: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Text(
          name!,
          style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 12),
        ),
      ),
      footer: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '$amount ',
                style: const TextStyle(color: Colors.black, fontSize: 12),
              ),
              TextSpan(
                text: percentage,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Myclippath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(0, size.height, 0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
