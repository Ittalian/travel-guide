import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/config/routes.dart';
import 'package:travel_guide/models/guide_list_item.dart';
import 'package:travel_guide/view_models/guide_list_item_view_model.dart';
import 'package:travel_guide/widget/base/base_image_container.dart';
import 'package:travel_guide/widget/guide_list/list_container.dart';

class GuideListItemView extends StatefulWidget {
  final String guideId;
  final String listId;
  const GuideListItemView(
      {super.key, required this.guideId, required this.listId});

  @override
  State<GuideListItemView> createState() => GuideListItemViewState();
}

class GuideListItemViewState extends State<GuideListItemView> {
  final List<ListContainer> listContainers = [];

  @override
  void initState() {
    super.initState();
    final guideListItemViewModel = context.read<GuideListItemViewModel>();
    guideListItemViewModel.fetchListItems(widget.listId);
    getListContainer(guideListItemViewModel);
  }

  void getListContainer(GuideListItemViewModel guideListItemViewModel) {
    setState(() {
      for (var list in guideListItemViewModel.listItems) {
        listContainers.add(ListContainer(
          initTitle: list.name,
          initDesciption: list.description,
        ));
      }
    });
  }

  void addListContainer() {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    final container = ListContainer(
        titleController: titleController,
        descriptionController: descriptionController);
    setState(() {
      listContainers.add(container);
    });
  }

  @override
  Widget build(BuildContext context) {
    final guideListItemViewModel = context.read<GuideListItemViewModel>();
    return BaseImageContainer(
        imagePath: 'images/list_background.jpg',
        child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0),
          body: Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.fromLTRB(15, 50, 15, 0),
            child: SingleChildScrollView(
                child: Column(children: [
              ...listContainers,
              const Padding(padding: EdgeInsets.only(top: 30)),
              TextButton(
                  onPressed: addListContainer,
                  child: const Text('アイテムを追加', style: TextStyle(fontSize: 20))),
              Container(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                      onPressed: () async {
                        for (var listContainer in listContainers) {
                          if (listContainer.titleController != null &&
                              listContainer.descriptionController != null) {
                            GuideListItem listItem = GuideListItem(
                                listId: widget.listId,
                                name: listContainer.titleController!.text,
                                description:
                                    listContainer.descriptionController!.text);
                            await guideListItemViewModel.addListItem(listItem);
                          }
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
