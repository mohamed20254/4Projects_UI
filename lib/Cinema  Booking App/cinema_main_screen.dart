import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/Cinema%20%20Booking%20App/const.dart';
import 'package:fluttertest/Cinema%20%20Booking%20App/home_screen.dart';

class CinemaMainScreen extends StatefulWidget {
  const CinemaMainScreen({super.key});

  @override
  State<CinemaMainScreen> createState() => _CinemaMainScreenState();
}

class _CinemaMainScreenState extends State<CinemaMainScreen> {
  late List<IconData> icons;
  late int currentindex;
  late List<Widget> pages;
  @override
  void initState() {
    pages = [
      HomeScreen(),
      page(icon: CupertinoIcons.compass_fill),
      page(icon: CupertinoIcons.ticket_fill),
      page(icon: Icons.person_rounded),
    ];
    icons = [
      Icons.home_filled,
      CupertinoIcons.compass_fill,
      CupertinoIcons.ticket_fill,
      Icons.person_rounded,
    ];
    currentindex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            icons.length,
            (index) => AnimatedContainer(
              height: currentindex == index ? 25 : 25,
              width: currentindex == index ? 25 : 25,
              duration: Duration(microseconds: 400),
              decoration: BoxDecoration(
                color: appBackgroundColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withValues(alpha: 0.1),
                    spreadRadius: currentindex == index ? 10 : 0,
                    blurRadius: currentindex == index ? 15 : 0,
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    currentindex = index;
                  });
                },
                child: Icon(
                  icons[index],
                  color:
                      currentindex == index
                          ? Colors.white
                          : Colors.white.withValues(alpha: 0.3),
                  size: 25,
                ),
              ),
            ),
          ),
        ),
      ),
      body: IndexedStack(index: currentindex, children: pages),
    );
  }
}

Widget page({required final IconData icon}) {
  return Center(child: Icon(icon, size: 28, color: Colors.white));
}
