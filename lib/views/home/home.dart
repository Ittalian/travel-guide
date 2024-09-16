import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/config/routes.dart';
import 'package:travel_guide/view_models/guide_view_model.dart';
import 'package:travel_guide/widget/base/base_button.dart';
import 'package:travel_guide/widget/base/base_image_container.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void browseGuide(String guideId) {
    Navigator.pushNamed(context, Routes.browse, arguments: guideId);
  }

  @override
  Widget build(BuildContext context) {
    final guideViewModel = context.watch<GuideViewModel>();
    return BaseImageContainer(
        imagePath: 'images/home_background.jpg',
        child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0),
          body: SingleChildScrollView(
              child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 200)),
              for (var guide in guideViewModel.guides)
                GestureDetector(
                    onTap: () => browseGuide(guide.guideId!),
                    child: Container(
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.all(10),
                      color: Colors.white.withOpacity(0.8),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              guide.title,
                              style: const TextStyle(fontSize: 20),
                            ),
                            Row(children: [
                              BaseButton(
                                  buttonText: '編集',
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, Routes.guideHome,
                                        arguments: {
                                          'isFirstPage': false,
                                          'guideId': guide.guideId,
                                        });
                                  }),
                              const Padding(padding: EdgeInsets.only(left: 5)),
                              BaseButton(
                                  buttonText: '削除',
                                  onPressed: () async {
                                    await guideViewModel
                                        .deleteGuide(guide.guideId!);
                                  })
                            ])
                          ]),
                    )),
            ],
          )),
          floatingActionButton: FloatingActionButton(
              tooltip: 'しおりを追加',
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, Routes.createTitle);
              }),
        ));
  }
}
