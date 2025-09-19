import 'package:flutter/material.dart';
import 'package:fluttertest/travel%20mobile%20App/home_screen.dart';
import 'package:fluttertest/travel%20mobile%20App/model/onbording_model.dart';

class OnbordingSreen extends StatelessWidget {
  const OnbordingSreen({super.key});

  @override
  // ignore: prefer_final_parameters
  Widget build(BuildContext context) {
    final ValueNotifier<int> _currentindex = ValueNotifier(0);
    final PageController controller = PageController();
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller,
            onPageChanged: (final value) {
              _currentindex.value = value;
            },
            itemCount: onboarding.length,
            itemBuilder: (final context, final index) {
              return Image.network(onboarding[index].image, fit: BoxFit.cover);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35, right: 12, left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ValueListenableBuilder(
                      valueListenable: _currentindex,
                      builder:
                          (context, value, child) => Visibility(
                            visible: onboarding.length - 1 != value,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(),

                              onPressed: () {},
                              child: const Text(
                                "Skip",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                    ),
                  ],
                ),
                ValueListenableBuilder(
                  valueListenable: _currentindex,
                  builder:
                      (final context, final value, final child) => Text(
                        onboarding[value].name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 55,
                          height: 1.3,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                        maxLines: 3,
                      ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "We Travelin are ready to help you on\nvacation around Nepal",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 200,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(onboarding.length, (final index) {
                      return ValueListenableBuilder(
                        valueListenable: _currentindex,
                        builder:
                            (final context, final value, final child) =>
                                AnimatedContainer(
                                  margin: const EdgeInsets.only(left: 7),
                                  height: 7,
                                  width: value == index ? 30 : 15,
                                  duration: const Duration(microseconds: 400),
                                  decoration: BoxDecoration(
                                    color:
                                        value == index
                                            ? Colors.white
                                            : Colors.grey,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                      );
                    }),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          ValueListenableBuilder(
                            valueListenable: _currentindex,
                            builder:
                                (context, value, child) => GestureDetector(
                                  onTap: () {
                                    if (value < onboarding.length - 1) {
                                      final nextPage = value + 1;
                                      _currentindex.value = nextPage;
                                      controller.animateToPage(
                                        nextPage,
                                        duration: const Duration(
                                          milliseconds: 400,
                                        ),
                                        curve: Curves.easeInOut,
                                      );
                                    } else {
                                      Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                          builder:
                                              (context) => const HomeScreen(),
                                        ),
                                        (route) => false,
                                      );
                                    }
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 65,
                                    decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black,

                                          blurRadius: 4,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Let's Get Started",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.3,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                          ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "already have account ?",
                                style: TextStyle(),
                              ),
                              Text(
                                " Login",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
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
    );
  }
}
