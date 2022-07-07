import 'package:covid_tracker_app/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constants.dart';

class SlotsDetailsScreen extends StatelessWidget {
  SlotsDetailsScreen({
    Key? key,
  }) : super(key: key);

  MainController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appPrimaryColor[100],
        title: Text(
          "Available Slot's",
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: SafeArea(
        child: GetBuilder<MainController>(
          builder: (controller) {
            return ListView.separated(
              itemCount: controller.availiableSlots.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.green[100]!,
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: const Offset(0, 2))
                      ],
                      gradient: LinearGradient(
                          colors: [Colors.green[100]!, Colors.green[200]!]),
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(12)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Center Id - ${controller.availiableSlots['sessions'][index]['center_id'].toString()}"),
                      Text(
                          "Center Name - ${controller.availiableSlots['sessions'][index]['name'].toString()}"),
                      Text(
                          "Center Address - ${controller.availiableSlots['sessions'][index]['address'].toString()}"),
                      Text(
                          "Vaccine Availiable - ${controller.availiableSlots['sessions'][index]['vaccine'].toString()}, ₹${controller.availiableSlots['sessions'][index]['fee'].toString()} "),
                      Text(
                          "Fee Type - ${controller.availiableSlots['sessions'][index]['fee_type']}"),
                      Text(
                          "Availiable Capacity - ${controller.availiableSlots['sessions'][index]['available_capacity']}"),
                      Text(
                          "Age : ${controller.availiableSlots['sessions'][index]['min_age_limit']} & Above"),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(
                    color: appPrimaryColor[100],
                    thickness: 0.7,
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
