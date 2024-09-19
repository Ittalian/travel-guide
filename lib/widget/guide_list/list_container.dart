import 'package:flutter/material.dart';
import 'package:travel_guide/widget/base/base_textformfield.dart';
import 'package:travel_guide/widget/guide_list/list_browse_text.dart';

class ListContainer extends StatefulWidget {
  final TextEditingController? titleController;
  final TextEditingController? descriptionController;
  final String? initTitle;
  final String? initDesciption;

  const ListContainer(
      {super.key,
      this.titleController,
      this.descriptionController,
      this.initTitle,
      this.initDesciption});

  @override
  State<ListContainer> createState() => ListContainerState();
}

class ListContainerState extends State<ListContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 146, 210, 100),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: widget.initTitle != null
                  ? ListBrowseText(text: widget.initTitle!, fontSize: 25)
                  : BaseTextformfield(
                      controller: widget.titleController!,
                      labelText: 'アイテム名',
                      isCenter: true,
                      fontSize: 25)),
          Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: widget.initDesciption != null
                  ? ListBrowseText(text: widget.initDesciption!, fontSize: 20)
                  : BaseTextformfield(
                      controller: widget.descriptionController!,
                      labelText: 'メモ',
                      isCenter: true,
                      fontSize: 20)),
        ],
      ),
    );
  }
}
