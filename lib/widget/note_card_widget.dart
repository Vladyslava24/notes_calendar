import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_try/model/note.dart';

class NoteCardWidget extends StatelessWidget {
  NoteCardWidget({
    Key? key,
    required this.note,
    required this.index,
  }) : super(key: key);

  final Note note;
  final int index;

  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    final time = DateFormat.yMMMd().format(note.createdTime);

    return ListTile(
      title: Text(
        note.hours + '.' + note.minutes + '   ' + note.description,
        style: _biggerFont,
      ),
      trailing: Text(
        time,
        style: TextStyle(color: Colors.grey.shade700),
      ),
    );
  }
}