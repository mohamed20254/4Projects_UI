import 'package:flutter/material.dart';
import 'package:fluttertest/burger_app/home_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int slectedindex = 0;
  late List<Widget> page;
  @override
  void initState() {
    page = [
      HomeScreen(),
      const pagewidget(namepage: "cart"),
      const pagewidget(namepage: "fav"),
      const pagewidget(namepage: "file"),
    ];
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black45,
        onTap: (final value) {
          setState(() {
            slectedindex = value;
          });
        },
        currentIndex: slectedindex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_open_outlined),
            label: "",
          ),
        ],
      ),
      body: IndexedStack(index: slectedindex, children: page),
    );
  }
}

class pagewidget extends StatelessWidget {
  final String namepage;
  const pagewidget({super.key, required this.namepage});

  @override
  Widget build(final BuildContext context) {
    return Center(child: Text(namepage, style: const TextStyle(fontSize: 20)));
  }
}
