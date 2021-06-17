import 'package:flutter/material.dart';

class NoteFormWidget extends StatelessWidget {
  final String? hours;
  final String? minutes;
  final String? description;
  final ValueChanged<String> onChangedHours;
  final ValueChanged<String> onChangedMinutes;
  final ValueChanged<String> onChangedDescription;

  const NoteFormWidget({
    Key? key,
    this.hours = '',
    this.minutes = '',
    this.description = '',
    required this.onChangedHours,
    required this.onChangedMinutes,
    required this.onChangedDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
    textDirection: TextDirection.ltr,
    crossAxisAlignment: CrossAxisAlignment.end,
    verticalDirection: VerticalDirection.up,
    mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(width: 20),
            Flexible(
              child: Container(
                width: 30,
                child: buildHours()
              ),
            ),
            Flexible (
              child: Container(
                child: buildMinutes()
                ),
            ),
            Flexible (
              flex: 4,
              child: Container(
                width: 350,
                child: buildDescription()),
            ),
        ],
      //),
    //),
  );

  Widget buildHours() => TextFormField(
    maxLines: 1,
    initialValue: hours,
    style: TextStyle(color: Colors.white60, fontSize: 18),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: '00',
      hintStyle: TextStyle(color: Colors.white60),
    ),
    validator: (title) => title != null && title.isEmpty
        ? 'The hours cannot be empty'
        : null,
    onChanged: onChangedHours,
  );

  Widget buildMinutes() => TextFormField(
    maxLines: 1,
    initialValue: minutes,
    style: TextStyle(color: Colors.white60, fontSize: 18),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: '00',
      hintStyle: TextStyle(color: Colors.white60),
    ),
    validator: (title) => title != null && title.isEmpty
        ? 'The minutes cannot be empty'
        : null,
    onChanged: onChangedMinutes,
  );

  Widget buildDescription() => TextFormField(
    maxLines: 5,
    initialValue: description,
    style: TextStyle(color: Colors.white60, fontSize: 18),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'Type something...',
      hintStyle: TextStyle(color: Colors.white60),
    ),
    validator: (title) => title != null && title.isEmpty
        ? 'The description cannot be empty'
        : null,
    onChanged: onChangedDescription,
  );
}



