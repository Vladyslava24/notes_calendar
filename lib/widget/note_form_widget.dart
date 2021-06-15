import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';

class NoteFormWidget extends StatelessWidget {
  final int? hours;
  final int? minutes;
  final String? description;
  final ValueChanged<int> onChangedHours;
  final ValueChanged<int> onChangedMinutes;
  final ValueChanged<String> onChangedDescription;

  const NoteFormWidget({
    Key? key,
    this.hours = 0,
    this.minutes = 0,
    this.description = '',
    required this.onChangedHours,
    required this.onChangedMinutes,
    required this.onChangedDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
    //child: Padding(
      //padding: EdgeInsets.all(16),
      //child: ListView(
    textDirection: TextDirection.ltr,
    crossAxisAlignment: CrossAxisAlignment.end,
    verticalDirection: VerticalDirection.up,
    mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
            child: ListTile(
                title: Text('00.00'),
            onTap: () {
              showPickerNumberFormatValue(context);
            },
          ),
          ),
            Expanded(child:
            //TextFormField(
              //title: Text('Add new note'),
              //onTap: () {
                buildDescription(),
             // },
            //),
            ),
        //mainAxisSize: MainAxisSize.min,
        //children: [
          //Row(
            /*children: [
              Switch(
                value: isImportant ?? false,
                onChanged: onChangedImportant,
              ),
              Expanded(
                child: Slider(
                  value: (number ?? 0).toDouble(),
                  min: 0,
                  max: 5,
                  divisions: 5,
                  onChanged: (number) => onChangedNumber(number.toInt()),
                ),
              )
            ], */
          //),
          //buildTitle(),
          //SizedBox(height: 8),
          //buildDescription(),
          //SizedBox(height: 16),
        ],
      //),
    //),
  );

  /*Widget buildTitle() => TextFormField(
    maxLines: 1,
    initialValue: title,
    style: TextStyle(
      color: Colors.white70,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'Title',
      hintStyle: TextStyle(color: Colors.white70),
    ),
    validator: (title) =>
    title != null && title.isEmpty ? 'The title cannot be empty' : null,
    onChanged: onChangedTitle,
  );*/

  showPickerNumberFormatValue(BuildContext context) {
    Picker(
        adapter: NumberPickerAdapter(data: [
          NumberPickerColumn(

              begin: 0,
              end: 23,
              onFormatValue: (v) {
                return v < 10 ? "0$v" : "$v";
              }
          ),
          NumberPickerColumn(begin: 0, end: 60,
              onFormatValue: (v) {
                return v < 10 ? "0$v" : "$v";
              }
          ),
        ]),
        delimiter: [
          PickerDelimiter(child: Container(
            width: 30.0,
            alignment: Alignment.center,
            child: Icon(Icons.more_vert),
          ))
        ],
        hideHeader: true,
        title: Text("Please Select"),
        selectedTextStyle: TextStyle(color: Colors.blue),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
    Duration _duration = Duration(hours: picker.getSelectedValues()[0], minutes: picker.getSelectedValues()[1]);
        }
    ).showDialog(context);
  }

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