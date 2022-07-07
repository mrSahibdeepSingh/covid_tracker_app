import 'package:covid_tracker_app/components/default_button.dart';
import 'package:covid_tracker_app/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constants.dart';

class VaccineSlot extends StatefulWidget {
  VaccineSlot({Key? key}) : super(key: key);

  @override
  State<VaccineSlot> createState() => _VaccineSlotState();
}

class _VaccineSlotState extends State<VaccineSlot> {
  TextEditingController pinEditingController = TextEditingController();
  TextEditingController dayEditingController = TextEditingController();

  String dropdownValue = "01";
  String vaccinetype = "--";
  List slots = [];
  MainController controller = Get.find();

  @override
  void dispose() {
    super.dispose();
    pinEditingController.clear();
    dayEditingController.clear();
    dropdownValue = "01";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appPrimaryColor[100],
        title: Text(
          "Find Slot",
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: appDefaultPadding,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                TextField(
                  controller: pinEditingController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  autofocus: true,
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: const InputDecoration(
                    hintText: "Enter PIN Code",
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: TextField(
                        controller: dayEditingController,
                        keyboardType: TextInputType.number,
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration:
                            const InputDecoration(hintText: "Enter Date"),
                      ),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>[
                          '01',
                          '02',
                          '03',
                          '04',
                          '05',
                          '06',
                          '07',
                          '08',
                          '09',
                          '10',
                          '11',
                          '12',
                        ]
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
                // DropdownButton<String>(
                //   isExpanded: true,
                //   value: vaccinetype,
                //   icon: const Icon(Icons.arrow_drop_down),
                //   elevation: 16,
                //   style: const TextStyle(color: Colors.deepPurple),
                //   underline: Container(
                //     height: 1,
                //     color: Colors.grey,
                //   ),
                //   onChanged: (newValue) {
                //     setState(() {
                //       vaccinetype = newValue!;
                //     });
                //   },
                //   items: <String>[
                //     '--',
                //     'Covaxin',
                //     'Covishield',
                //   ]
                //       .map((item) => DropdownMenuItem<String>(
                //             value: item,
                //             child: Text(
                //               item,
                //               style: Theme.of(context).textTheme.bodyText1,
                //             ),
                //           ))
                //       .toList(),
                // ),
                const SizedBox(height: 20),
                DefaultButton(
                    text: "Find Slot",
                    press: () {
                      controller.fetchVaccineSlots(pinEditingController.text,
                          dayEditingController.text, dropdownValue);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
