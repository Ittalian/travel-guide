import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/config/routes.dart';
import 'package:travel_guide/models/guide.dart';
import 'package:travel_guide/view_models/guide_view_model.dart';
import 'package:travel_guide/widget/base/base_button.dart';
import 'package:travel_guide/widget/base/base_image_container.dart';
import 'package:travel_guide/widget/base/base_textformfield.dart';

class CreateTitleView extends StatelessWidget {
  const CreateTitleView({super.key});

  @override
  Widget build(BuildContext context) {
    final guideViewModel = context.watch<GuideViewModel>();
    final TextEditingController titleController = TextEditingController();
    return BaseImageContainer(
        imagePath: 'images/create_title_background.jpg',
        child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                padding: const EdgeInsets.all(5),
                color: Colors.white.withOpacity(0.8),
                child: BaseTextformfield(
                    controller: titleController,
                    labelText: 'タイトルを入力してください',
                    isCenter: false,
                    onChanged: (value) => titleController.text = value),
              ),
              const Padding(padding: EdgeInsets.only(top: 50)),
              BaseButton(
                  buttonText: '次へ',
                  onPressed: () async {
                    Guide guide = Guide(title: titleController.text);
                    String guideId = await guideViewModel.addGuide(guide);
                    Navigator.pushNamed(context, Routes.guideHome, arguments: {
                      'isFirstPage': true,
                      'guideId': guideId,
                    });
                  }),
            ],
          ),
        ));
  }
}
