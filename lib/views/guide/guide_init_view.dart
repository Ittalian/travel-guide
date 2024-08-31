import 'package:flutter/material.dart';
import 'package:travel_guide/widget/base/base_button.dart';
import 'package:travel_guide/widget/base/base_image_container.dart';

class GuideInitView extends StatelessWidget {
  final bool isFirstPage;
  final Function() addSchedulePage;
  const GuideInitView({super.key, required this.isFirstPage, required this.addSchedulePage});

  @override
  Widget build(BuildContext context) {
    return BaseImageContainer(
        imagePath: 'images/init_background.jpg',
        child: Scaffold(
            backgroundColor: Colors.white.withOpacity(0),
            body: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BaseButton(
                        buttonText: 'スケジュール',
                        onPressed: addSchedulePage
                        //  () {
                        //   Navigator.pushNamed(context, Routes.schedule);
                        // }
                        ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    BaseButton(buttonText: 'リスト', onPressed: () {}),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    if (!isFirstPage)
                      BaseButton(buttonText: '保存', onPressed: () {})
                  ],
                ))));
  }
}
