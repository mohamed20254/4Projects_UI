import 'package:flutter/material.dart';
import 'package:fluttertest/burger_app/home.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size siz = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: siz.height,
        width: siz.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://wallpaperbat.com/img/904498-burger-iphone-wallpaper-hd.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50),
              height: siz.height * 0.5,
              width: siz.width,

              child: const Column(
                children: [
                  Text("                              👑"),
                  Text(
                    "BURGER\n QUEEN",
                    style: TextStyle(
                      letterSpacing: 5,
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      height: 0.9,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(30),
              height: siz.height * 0.5,
              width: siz.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,

                  colors: [Colors.black, Colors.black54, Colors.transparent],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: siz.height * 0.15),

                  const Text(
                    "Good Food\nTasty Food *",
                    style: TextStyle(
                      height: 0.9,
                      letterSpacing: 3,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.orange,
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.orange[700],
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (final context) => const Home(),
                            ),
                          );
                        },
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Don`t have an account ?  ",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white30,
                              ),
                            ),
                            TextSpan(
                              text: "Sig up",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
