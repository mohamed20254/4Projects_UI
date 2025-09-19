import 'dart:ui';

List<String> menuItem = [
  "breackFast",
  "Lunch",
  "Dinner",
  "Snack",
  "Cheat Menu",
];

class RecipItems {
  final String image, name, woner, wonername, review;
  final int carb;
  final double rate;
  final int calorie, fate, protein, weight;
  final bool fav;
  RecipItems({
    required this.image,
    required this.name,
    required this.woner,
    required this.wonername,
    required this.review,
    required this.carb,
    required this.rate,
    required this.calorie,
    required this.fate,
    required this.protein,
    required this.weight,
    required this.fav,
  });
}

List<RecipItems> recipeItemsList = [
  RecipItems(
    image: "https://images.unsplash.com/photo-1504674900247-0877df9cc836",
    name: "Pasta Carbonara",
    woner: "chef1",
    wonername: "John Doe",
    review: "20",
    carb: 75,
    rate: 4.5,
    calorie: 500,
    fate: 20,
    protein: 15,
    weight: 250,
    fav: true,
  ),
  RecipItems(
    image:
        "https://tse1.mm.bing.net/th/id/OIP.coKx-xhVKV9yBGO9KPYBTgHaLH?rs=1&pid=ImgDetMain&o=7&rm=3",
    name: "Avocado Toast",
    woner: "chef2",
    wonername: "Jane Smith",
    review: "40",
    carb: 30,
    rate: 4.8,
    calorie: 300,
    fate: 10,
    protein: 8,
    weight: 150,
    fav: false,
  ),
  RecipItems(
    image:
        "https://th.bing.com/th/id/R.793286e77aeaab078eb636b067cca253?rik=fQdZd3msZeHVBQ&pid=ImgRaw&r=0",
    name: "Berry Smoothie",
    woner: "chef3",
    wonername: "Alice Brown",
    review: "50",
    carb: 40,
    rate: 4.6,
    calorie: 220,
    fate: 5,
    protein: 3,
    weight: 350,
    fav: true,
  ),
  RecipItems(
    image:
        "https://th.bing.com/th/id/OIP.ocelpEmf0BNyZQkGjblYmgHaHa?o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3",
    name: "Burger Deluxe",
    woner: "chef4",
    wonername: "Mike Wilson",
    review: "60.",
    carb: 50,
    rate: 4.7,
    calorie: 650,
    fate: 30,
    protein: 25,
    weight: 300,
    fav: false,
  ),
  RecipItems(
    image: "https://images.unsplash.com/photo-1504674900247-0877df9cc836",
    name: "Chocolate Cake",
    woner: "chef5",
    wonername: "Emily Davis",
    review: "30",
    carb: 90,
    rate: 4.9,
    calorie: 700,
    fate: 35,
    protein: 8,
    weight: 200,
    fav: true,
  ),
];

class Category {
  final String name, image;
  final Color color;

  Category({required this.name, required this.image, required this.color});
}

List<Category> recipeCategory = [
  Category(
    name: 'Oats',
    image: 'assets/recipe_images/oats.png',
    color: const Color(0xffd8d8d8),
  ),
  Category(
    name: 'Cereals',
    image: 'assets/recipe_images/cereal.png',
    color: const Color(0xfff4cfcc),
  ),
  Category(
    name: 'Fruits',
    image: 'assets/recipe_images/banana.png',
    color: const Color(0xffb8efd0),
  ),
  Category(
    name: 'Vegetable',
    image: 'assets/recipe_images/corn.png',
    color: const Color(0xffffe9b2),
  ),
  Category(
    name: 'Bread',
    image: 'assets/recipe_images/bread.png',
    color: const Color(0xffddd0a4),
  ),
];
