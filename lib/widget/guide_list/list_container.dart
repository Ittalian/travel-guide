import 'package:flutter/material.dart';
import 'package:travel_guide/widget/base/base_textformfield.dart';

class ListContainer extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  const ListContainer(
      {super.key,
      required this.titleController,
      required this.descriptionController});

  @override
  State<ListContainer> createState() => ListContainerState();
}

class ListContainerState extends State<ListContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 146, 210, 100),
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: BaseTextformfield(
                  controller: widget.titleController,
                  labelText: 'アイテム名',
                  isCenter: true,
                  fontSize: 25)),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: BaseTextformfield(
              controller: widget.descriptionController,
              labelText: 'メモ',
              isCenter: true,
              fontSize: 20)),
        ],
      ),
    );
  }
}
