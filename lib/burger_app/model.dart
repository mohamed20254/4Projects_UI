List<String> categoryList = ["🥩 Beef", "🧀 cheess", "🍤 Shrimp", "🍕 Pizza"];

class Burger {
  final String name, image, distance, description;
  final double price, rating;

  final bool isFav;

  Burger({
    required this.name,
    required this.image,
    required this.distance,
    required this.description,
    required this.price,
    required this.rating,
    required this.isFav,
  });
}

List<Burger> beefBurgers = [
  Burger(
    name: "Classic Beef Burger",
    image:
        "https://tse2.mm.bing.net/th/id/OIP.dIMMfvzPpMs26X9zbbJUGgHaHa?w=626&h=626&rs=1&pid=ImgDetMain&o=7&rm=3",
    distance: "2 km",
    description:
        " Juicy beef patty with lettuce and tomato Juicy beef patty with lettuce and tomato Juicy beef patty with lettuce and tomato Juicy beef patty with lettuce and tomato Juicy beef patty with lettuce and tomato",
    price: 5.5,
    rating: 4.4,
    isFav: true,
  ),
  Burger(
    name: "Double Beef Burger",
    image: "https://img.freepik.com/premium-photo/burger_811553-2534.jpg",
    distance: "3 km",
    description:
        "Double beef patties with cheddar cheese Double beef patties with cheddar cheese Double beef patties with cheddar cheeseDouble beef patties with cheddar cheeseDouble beef patties with cheddar cheeseDouble beef patties with cheddar cheese",
    price: 6.8,
    rating: 4.7,
    isFav: false,
  ),
];

// Cheese Burgers
List<Burger> cheeseBurgers = [
  Burger(
    name: "Cheddar Cheese Burger",
    image:
        "https://tse1.mm.bing.net/th/id/OIP.fYwO_1xDsHUBoYU0lMZ1MgHaHa?w=1960&h=1960&rs=1&pid=ImgDetMain&o=7&rm=3",
    distance: "1.8 km",
    description: "Burger topped with melted cheddar cheese",
    price: 5.2,
    rating: 4.3,
    isFav: false,
  ),
  Burger(
    name: "Mozzarella Cheese Burger",
    image:
        "https://tse1.mm.bing.net/th/id/OIP.fYwO_1xDsHUBoYU0lMZ1MgHaHa?w=1960&h=1960&rs=1&pid=ImgDetMain&o=7&rm=33",
    distance: "2.1 km",
    description: "Soft mozzarella cheese with fresh veggies",
    price: 5.7,
    rating: 4.6,
    isFav: true,
  ),
];

// Shrimp Burgers
List<Burger> shrimpBurgers = [
  Burger(
    name: "Crispy Shrimp Burger",
    image: "https://example.com/images/shrimp1.png",
    distance: "2.5 km",
    description: "Crispy fried shrimp with spicy sauce",
    price: 6.9,
    rating: 4.5,
    isFav: false,
  ),
  Burger(
    name: "Crispy Shrimp Burger",
    image:
        "https://tse1.mm.bing.net/th/id/OIP.qaX8e9mO2nG-pHLkL8DEvQHaEc?w=1200&h=720&rs=1&pid=ImgDetMain&o=7&rm=3",
    distance: "3 km",
    description: "Grilled shrimp with garlic butter flavor",
    price: 7.2,
    rating: 4.7,
    isFav: true,
  ),
];

// Pizza Burgers
List<Burger> pizzaBurgers = [
  Burger(
    name: "Pepperoni Pizza Burger",
    image:
        "https://tse1.mm.bing.net/th/id/OIP.qaX8e9mO2nG-pHLkL8DEvQHaEc?w=1200&h=720&rs=1&pid=ImgDetMain&o=7&rm=3",
    distance: "2.7 km",
    description: "Burger with pepperoni and pizza sauce",
    price: 7.5,
    rating: 4.8,
    isFav: true,
  ),
  Burger(
    name: "Veggie Pizza Burger",
    image:
        "https://tse2.mm.bing.net/th/id/OIP.XlHExu0ShaSH9PYBF2Z1NgHaHa?rs=1&pid=ImgDetMain&o=7&rm=3",
    distance: "3.2 km",
    description: "Burger with pizza veggies and mozzarella",
    price: 7.0,
    rating: 4.6,
    isFav: false,
  ),
];
