import 'package:covid_tracker_app/controllers/main_controller.dart';
import 'package:covid_tracker_app/cubit/internet_cubit.dart';
import 'package:covid_tracker_app/views/qus_answers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../components/most_effected_panel.dart';
import '../components/world_panel.dart';
import '../utils/constants.dart';
import 'all_regions_screen.dart';
import 'vaccine_slot.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  MainController controller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<InternetCubit, InternetState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // sliver App Bar
              SliverAppBar(
                backgroundColor: appPrimaryColor[100],
                title: Text('Covid-x Tracker',
                    style: Theme.of(context).textTheme.headline6),
                expandedHeight: MediaQuery.of(context).size.height * 0.20,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/images/splash_image1.png',
                    height: MediaQuery.of(context).size.height * 0.10,
                  ),
                ),
                pinned: true,
              ),

              // sliver items

              SliverToBoxAdapter(
                child: Padding(
                  padding: appDefaultPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.orange[100],
                        ),
                        margin: const EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                        height: screenHeight * 0.11,

                        child: Text(
                          Source.quote,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Worldwide',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => AllRegionsScreen());
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black,
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  'Regional',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GetBuilder<MainController>(builder: (controller) {
                        return controller.worldData.isEmpty
                            ? const CircularProgressIndicator()
                            : WorldWidePanel(worldDate: controller.worldData);
                      }),
                      titleContainer(context, "Popular Countries"),
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(5, (index) {
                            return MostEffectedPanel(
                              index: index,
                            );
                          }),
                        ),
                      ),
                      titleContainer(context, "Other's"),
                      InfoPanel(
                        text: "FAQ's",
                        panelColor: Colors.grey[400]!,
                        press: () {
                          Get.to(() => const FAQScreen());
                        },
                      ),
                      InfoPanel(
                        text: "VACCINE SLOT",
                        panelColor: Colors.blue[100]!,
                        press: () {
                          Get.to(() => VaccineSlot());
                        },
                      ),
                      InfoPanel(
                        text: "DONATE",
                        panelColor: Colors.amber[100]!,
                        press: () {
                          launchUrlString(
                              "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/donate");
                        },
                      ),
                      InfoPanel(
                        text: "Myth BUSTERS",
                        panelColor: Colors.red[200]!,
                        press: () {
                          launchUrlString(
                              "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters");
                        },
                      ),
                      const SizedBox(height: 8),
                      const Divider(
                        thickness: 1.5,
                        indent: 30,
                        endIndent: 30,
                      ),
                      Center(
                        child: Text(
                          "WE ARE TOGETHER IN THE FIGHT",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Padding titleContainer(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}

class InfoPanel extends StatelessWidget {
  const InfoPanel(
      {Key? key,
      required this.text,
      required this.panelColor,
      required this.press})
      : super(key: key);

  final String text;
  final Color panelColor;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: panelColor),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const Icon(
              Icons.arrow_forward_ios_sharp,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
