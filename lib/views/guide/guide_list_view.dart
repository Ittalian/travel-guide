import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/config/routes.dart';
import 'package:travel_guide/models/guide_list_item.dart';
import 'package:travel_guide/utils/list/list_data.dart';
import 'package:travel_guide/view_models/guide_list_item_view_model.dart';
import 'package:travel_guide/widget/base/base_image_container.dart';
import 'package:travel_guide/widget/guide_list/list_container.dart';

class GuideListItemView extends StatefulWidget {
  final String guideId;
  final String listId;
  const GuideListItemView(
      {super.key, required this.guideId, required this.listId});

  @override
  State<GuideListItemView> createState() => GuideListViewState();
}

class GuideListViewState extends State<GuideListItemView> {
  final List<ListData> listContainers = [];

  @override
  void initState() {
    super.initState();
    addListContainer();
  }

  void addListContainer() {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    setState(() {
      listContainers.add(ListData(
          titleController: titleController,
          descriptionController: descriptionController));
    });
  }

  @override
  Widget build(BuildContext context) {
    final guideListItemViewModel = context.watch<GuideListItemViewModel>();
    return BaseImageContainer(
        imagePath: 'images/list_background.jpg',
        child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0),
          body: Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.fromLTRB(15, 50, 15, 0),
            child: SingleChildScrollView(
                child: Column(children: [
              for (var i = 0; i < listContainers.length; i += 2)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ListContainer(
                        titleController: listContainers[i].titleController,
                        descriptionController:
                            listContainers[i].descriptionController,
                      ),
                    ),
                    if (i + 1 < listContainers.length)
                      Expanded(
                        child: ListContainer(
                          titleController:
                              listContainers[i + 1].titleController,
                          descriptionController:
                              listContainers[i + 1].descriptionController,
                        ),
                      ),
                  ],
                ),
              const Padding(padding: EdgeInsets.only(top: 30)),
              TextButton(
                  onPressed: addListContainer,
                  child: const Text('アイテムを追加', style: TextStyle(fontSize: 20))),
              Container(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                      onPressed: () {
                        for (var listContainer in listContainers) {
                          GuideListItem listItem = GuideListItem(
                              listId: widget.listId,
                              name: listContainer.titleController.text,
                              description:
                                  listContainer.descriptionController.text);
                          guideListItemViewModel.addListItem(listItem);
                        }
                        Navigator.pushNamed(
                          context,
                          Routes.guideHome,
                          arguments: {
                            'isFirstPage': false,
                            'guideId': widget.guideId,
                          },
                        );
                      },
                      child: const Text('保存'))),
            ])),
          ),
        ));
  }
}
