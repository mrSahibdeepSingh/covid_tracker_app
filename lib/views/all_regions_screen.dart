import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';
import '../utils/constants.dart';

class AllRegionsScreen extends StatelessWidget {
  AllRegionsScreen({Key? key}) : super(key: key);

  MainController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance!.addPostFrameCallback((frame) {
    //   controller.fetchCountryData();
    // });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appPrimaryColor[100],
        title: Text(
          "Countries Detail's",
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: SafeArea(
        child: GetBuilder<MainController>(
          builder: (controller) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.activeCasesList.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.activeCasesList[index]['Country_text'],
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(height: 5),
                        Text(
                            "Active Cases : ${controller.activeCasesList[index]['Active Cases_text']}"),
                        Text(
                            "Recovered Cases : ${controller.activeCasesList[index]['Total Recovered_text']}"),
                        controller.activeCasesList[index]['New Deaths_text'] ==
                                ''
                            ? const Text("New Death Cases : --")
                            : Text(
                                "New Death Cases : ${controller.activeCasesList[index]['New Deaths_text']}"),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
