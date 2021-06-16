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
      /*subtitle: Text(
        note.hours.toString() + '.' + note.minutes.toString(),
        style: _biggerFont,
      ),*/
      title: Text(
        note.hours.toString() + '.' + note.minutes.toString() + '   ' + note.description,
        style: _biggerFont,
      ),
      trailing: Text(
        time,
        style: TextStyle(color: Colors.grey.shade700),
      ),
      /*onTap: () {
        // NEW lines from here...
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },*/               // ... to here.
    );
  }
}