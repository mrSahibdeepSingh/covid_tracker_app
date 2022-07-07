import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonDialog {
  // Show Dialog

  static showLoading({String title = 'Loading'}) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: 40,
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(title),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  // Hide Dialog

  static hideDialog() {
    Get.back();
  }

  // Error Dialog

  static showError(
      {String title = "Oops Error!",
      String description = 'Something went wrong!'}) {
    Get.dialog(
      Dialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Get.textTheme.titleMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                description,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (Get.isDialogOpen!) Get.back();
                },
                child: const Text("Okay"),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
