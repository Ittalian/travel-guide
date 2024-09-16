import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/view_models/guide_list_item_view_model.dart';
import 'package:travel_guide/widget/base/base_image_container.dart';
import 'package:travel_guide/widget/guide_list/list_container.dart';

class GuideListBrowse extends StatelessWidget {
  final String listId;
  const GuideListBrowse({super.key, required this.listId});

  @override
  Widget build(BuildContext context) {
    final guideListItemVewModel = context.watch<GuideListItemViewModel>();
    guideListItemVewModel.fetchListItems(listId);
    return BaseImageContainer(
        imagePath: 'images/list_background.jpg',
        child: Container(
            margin: const EdgeInsets.only(top: 50),
            child: SingleChildScrollView(
                child: Column(children: [
              for (var i = 0;
                  i < guideListItemVewModel.listItems.length;
                  i += 2)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ListContainer(
                        initTitle: guideListItemVewModel.listItems[i].name,
                        initDesciption:
                            guideListItemVewModel.listItems[i].description,
                      ),
                    ),
                    if (i + 1 < guideListItemVewModel.listItems.length)
                      Expanded(
                        child: ListContainer(
                          initTitle:
                              guideListItemVewModel.listItems[i + 1].name,
                          initDesciption: guideListItemVewModel
                              .listItems[i + 1].description,
                        ),
                      ),
                  ],
                ),
            ]))));
  }
}
