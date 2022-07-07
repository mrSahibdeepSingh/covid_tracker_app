import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to covid-x",
      "image":
          "https://www.iconpacks.net/icons/2/free-coronavirus-icon-3533-thumb.png"
    },
    {
      "text": "Welcome to covid-11",
      "image":
          "https://www.iconpacks.net/icons/2/free-coronavirus-icon-3533-thumb.png"
    }
  ];

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Get.off(() => HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.90,
          child: Column(
            children: const [
              SizedBox(
                height: 30,
              ),
              Expanded(
                flex: 3,
                child: SplashContent(),
              ),
              Spacer(
                flex: 1,
              ),
              // Expanded(
              //   flex: 2,
              //   child: Column(
              //     children: [
              //       const Spacer(),
              //       DefaultButton(
              //           text: 'Continue',
              //           press: () {
              //             Get.off(() => HomeScreen());
              //           }),
              //       const Spacer(),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'COVID - X',
          style: Theme.of(context).textTheme.headline1,
        ),
        Text(
          'Welcome to covid-x',
          style: Theme.of(context).textTheme.headline6,
        ),
        const Spacer(
          flex: 2,
        ),
        Image.asset(
          'assets/images/splash_image1.png',
          height: MediaQuery.of(context).size.height * 0.40,
        )
      ],
    );
  }
}
