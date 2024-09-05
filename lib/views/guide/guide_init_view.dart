import 'package:flutter/material.dart';
import 'package:travel_guide/widget/base/base_button.dart';
import 'package:travel_guide/widget/base/base_image_container.dart';

class GuideInitView extends StatelessWidget {
  final Function() addSchedulePage;
  final Function() addListPage;
  final Function() saveGuide;
  final String imagePath;
  final bool isFirstPage;
  const GuideInitView(
      {super.key,
      required this.isFirstPage,
      required this.addSchedulePage,
      required this.addListPage,
      required this.saveGuide,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return BaseImageContainer(
        imagePath: imagePath,
        child: Scaffold(
            backgroundColor: Colors.white.withOpacity(0),
            body: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BaseButton(
                        buttonText: 'スケジュール', onPressed: addSchedulePage),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    BaseButton(buttonText: 'リスト', onPressed: addListPage),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    if (!isFirstPage)
                      BaseButton(buttonText: '保存', onPressed: saveGuide)
                  ],
                ))));
  }
}
