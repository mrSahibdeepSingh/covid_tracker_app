import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "No Internet Connection!",
                style: Theme.of(context).textTheme.headline3,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 200,
                width: 200,
                child: Image.asset(
                  "assets/images/Error.png",
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
