import 'package:flutter/material.dart';

class NoteFormWidget extends StatelessWidget {
  final String? description;
  final ValueChanged<String> onChangedDescription;

  const NoteFormWidget({
    Key? key,
    this.description = '',
    required this.onChangedDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(/*
            children: [
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
          ),
          //buildTitle(),
          SizedBox(height: 8),
          buildDescription(),
          SizedBox(height: 16),
        ],
      ),
    ),
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