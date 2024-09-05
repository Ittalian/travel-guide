import 'package:flutter/material.dart';
import 'package:travel_guide/widget/base/base_textformfield.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;

class ScheduleContainer extends StatefulWidget {
  final TextEditingController detailController;
  final TextEditingController dateController;
  const ScheduleContainer(
      {super.key,
      required this.detailController,
      required this.dateController});

  @override
  State<ScheduleContainer> createState() => ScheduleContainerState();
}

class ScheduleContainerState extends State<ScheduleContainer> {
  String selectedDate = '';
  String detail = '';
  Color containerColor = const Color.fromARGB(255, 220, 162, 162);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      color: containerColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () {
                picker.DatePicker.showTimePicker(context,
                    showTitleActions: true,
                    showSecondsColumn: false, onConfirm: (date) {
                  setState(() {
                    selectedDate = '${date.hour}:${date.minute.toString().padLeft(2, '0')}';
                  });
                  widget.dateController.text = selectedDate;
                }, currentTime: DateTime.now(), locale: picker.LocaleType.jp);
              },
              child: widget.dateController.text.isEmpty
                  ? const Text('時間を選択')
                  : Text(
                      widget.dateController.text,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          decorationColor: containerColor),
                      overflow: TextOverflow.ellipsis,
                    )),
          const SizedBox(
            height: 50,
            child: VerticalDivider(
              color: Colors.black,
              thickness: 2,
              width: 20,
            ),
          ),
          Expanded(
              child: Card(
                  child: BaseTextformfield(
                      controller: widget.detailController,
                      labelText: '詳細',
                      isCenter: false,
                      color: const Color.fromARGB(255, 220, 162, 162),
                      onChanged: (value) {
                        setState(() {
                          detail = value;
                        });
                        widget.detailController.text = detail;
                      }))),
        ],
      ),
    );
  }
}
