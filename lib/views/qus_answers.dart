import 'package:covid_tracker_app/utils/constants.dart';
import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appPrimaryColor[100],
        title: Text(
          "FAQ's",
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: Source.questionAnswers.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Text(
                Source.questionAnswers[index]['question'],
                style: Theme.of(context).textTheme.bodyText2,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    Source.questionAnswers[index]['answer'],
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
