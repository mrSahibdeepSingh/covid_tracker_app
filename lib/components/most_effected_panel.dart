import 'package:covid_tracker_app/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MostEffectedPanel extends StatelessWidget {
  MostEffectedPanel({
    Key? key,
    required this.index,
    // required this.activeCases,
    // required this.countryName,
  }) : super(key: key);

  final int index;
  // final String countryName;
  // final String activeCases;

  MainController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        decoration: BoxDecoration(
            color: Colors.red[100],
            border: Border.all(width: 1.0, color: Colors.white),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: const BoxDecoration(
                color: Color(0xFF5874DF),
                borderRadius: BorderRadius.all(
                  Radius.elliptical(30, 30),
                ),
              ),
              child: const Center(
                  child: ClipOval(
                child: Icon(
                  Icons.flag,
                  size: 25,
                ),
              )),
            ),
            GetBuilder<MainController>(
              builder: (controller) {
                return Container(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    children: [
                      Text(
                        controller.activeCasesList.isEmpty
                            ? "--"
                            : controller.activeCasesList[index]['Country_text'],
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          controller.activeCasesList.isEmpty
                              ? "--"
                              : controller.activeCasesList[index]
                                  ['Active Cases_text'],
                          style: Theme.of(context).textTheme.headline6),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
