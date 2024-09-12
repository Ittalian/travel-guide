import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/view_models/guide_list_view_model.dart';
import 'package:travel_guide/widget/base/base_image_container.dart';
import 'package:travel_guide/widget/guide_list/list_container.dart';

class GuideListBrowse extends StatelessWidget {
  final String guideId;
  const GuideListBrowse({super.key, required this.guideId});

  @override
  Widget build(BuildContext context) {
    final guideListViewModel = context.watch<GuideListViewModel>();
    guideListViewModel.fetchLists(guideId);
    return BaseImageContainer(
        imagePath: 'images/list_background.jpg',
        child: Container(
            margin: const EdgeInsets.only(top: 50),
            child: SingleChildScrollView(
                child: Column(children: [
                  for (var i = 0; i < guideListViewModel.lists.length; i += 2)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ListContainer(
                        initTitle: guideListViewModel.lists[i].title,
                        initDesciption: guideListViewModel.lists[i].description,
                      ),
                    ),
                    if (i + 1 < guideListViewModel.lists.length)
                      Expanded(
                        child: ListContainer(
                          initTitle: guideListViewModel.lists[i + 1].title,
                          initDesciption: guideListViewModel.lists[i + 1].description,
                        ),
                      ),
                  ],
                ),
            ]))));
  }
}
