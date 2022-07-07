import 'dart:developer';

import 'package:covid_tracker_app/services/api_service.dart';
import 'package:covid_tracker_app/utils/common_dialog.dart';
import 'package:get/get.dart';

import '../views/slots_screen.dart';

class MainController extends GetxController {
  @override
  onReady() {
    super.onReady();
    fetchWorldData();
    fetchCountryData();
  }

  Map<dynamic, dynamic> worldData = {};
  Map<dynamic, dynamic> availiableSlots = {};
  List<dynamic> countriesData = [];

  fetchWorldData() async {
    CommonDialog.showLoading();
    try {
      final response = await APIService().fetchWorldwideData("/world");
      CommonDialog.hideDialog();
      worldData = response;

      update();
    } catch (error) {
      CommonDialog.hideDialog();
      log(error.toString());
    }
  }

  List activeCasesList = [];
  // All Countries
  fetchCountryData() async {
    activeCasesList = [];
    CommonDialog.showLoading();
    try {
      final response = await APIService().fetchCountryData();

      CommonDialog.hideDialog();
      for (var item in response) {
        if (item['Active Cases_text'] != '' &&
            item['Country_text'] != 'World') {
          activeCasesList.add(item);
        }
      }
      // print("Active lIst ----- $activeCasesList");

      update();
    } catch (error) {
      CommonDialog.hideDialog();
      log(error.toString());
    }
  }

  fetchVaccineSlots(String pinCode, String date, String month) async {
    CommonDialog.showLoading();

    try {
      final response = await APIService().fetchSlots(pinCode, date, month);

      CommonDialog.hideDialog();
      availiableSlots = response;

      update();
      Get.to(() => SlotsDetailsScreen());
    } catch (e) {
      CommonDialog.hideDialog();
      log(e.toString());
    }
  }
}
