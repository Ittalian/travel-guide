import 'package:flutter/material.dart';
import 'package:travel_guide/widget/base/base_textformfield.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:travel_guide/widget/guide_schedule/schedule_date_text.dart';

class ScheduleContainer extends StatefulWidget {
  final TextEditingController? detailController;
  final TextEditingController? dateController;
  final String? initDetail;
  final String? initDate;
  const ScheduleContainer({
    super.key,
    this.detailController,
    this.dateController,
    this.initDetail,
    this.initDate,
  });

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
          widget.dateController == null
              ? Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ScheduleDateText(
                      containerColor: containerColor, text: widget.initDate!))
              : TextButton(
                  onPressed: () {
                    picker.DatePicker.showTimePicker(context,
                        showTitleActions: true,
                        showSecondsColumn: false, onConfirm: (date) {
                      setState(() {
                        selectedDate =
                            '${date.hour}:${date.minute.toString().padLeft(2, '0')}';
                      });
                      widget.dateController!.text = selectedDate;
                    },
                        currentTime: DateTime.now(),
                        locale: picker.LocaleType.jp);
                  },
                  child: widget.dateController!.text.isEmpty
                      ? const Text('時間を選択')
                      : ScheduleDateText(
                          containerColor: containerColor,
                          text: widget.dateController!.text)),
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
                  child: widget.detailController == null
                      ? Container(
                          color: containerColor,
                          child: Text(widget.initDetail!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 20)))
                      : BaseTextformfield(
                          controller: widget.detailController!,
                          labelText: '詳細',
                          isCenter: false,
                          color: const Color.fromARGB(255, 220, 162, 162),
                        ))),
        ],
      ),
    );
  }
}
