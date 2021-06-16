import 'package:flutter/material.dart';
import 'package:notes_try/db/note_database.dart';
import 'package:notes_try/model/note.dart';
import 'package:notes_try/widget/note_card_widget.dart';

import 'edit_note_page.dart';
import 'note_detail_page.dart';

class NotesPage extends StatefulWidget {
  final DateTime date;

  NotesPage(this.date);


  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late List<Note> notes;
  bool isLoading = false;
  late Map<DateTime, List<Note>> selectedNotes;


  @override
  void initState(){
    selectedNotes = {};
    super.initState();

    refreshNotes();
  }

  List<Note> _getEventsfromDay(DateTime date) {
    return selectedNotes[date] ?? [];
  }

  /*@override
  void dispose() {
    NotesDatabase.instance.close();

    super.dispose();
  }*/

  Future refreshNotes() async {
    setState(() => isLoading = true);
    final resultList = await NotesDatabase.instance.readAllNotes();
    final filteredList = resultList.where((element) => element.createdTime.toString().substring(0, 10).
                                          contains(widget.date.toString().substring(0, 10))).toList();
    //this.notes = await NotesDatabase.instance.readAllNotes();
    this.notes = filteredList;
    //print(resultList.toString());
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(
        'Notes',
        style: TextStyle(fontSize: 24),
      ),
      actions: [Icon(Icons.search), SizedBox(width: 12)],
    ),
    body: Center(
      child: isLoading
          ? CircularProgressIndicator()
          : notes.isEmpty
          ? Text(
        'No Notes',
        style: TextStyle(color: Colors.white, fontSize: 24),
      )
          : buildNotes1(),
    ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.black,
      child: Icon(Icons.add),
      onPressed: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AddEditNotePage(widget.date)),
        );

        refreshNotes();
      },
    ),
  );

  Widget buildNotes1() => ListView.builder(
      padding: const EdgeInsets.all(16.0),
    itemCount: notes.length,
    //staggeredTileBuilder: (index) => StaggeredTile.fit(2),
      itemBuilder: (context, index) {
        final note = notes[index];

        return Dismissible(
          // Each Dismissible must contain a Key. Keys allow Flutter to
          // uniquely identify widgets.
          key: Key(note.toString()),
          // Provide a function that tells the app
          // what to do after an item has been swiped away.
          onDismissed: (direction) {
          if(direction == DismissDirection.endToStart) {
            // Remove the item from the data source.
            setState(() async {
              await NotesDatabase.instance.delete(note.id!);
              //notes.removeAt(index);
            });
          }
            // Then show a snackbar.
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('$note dismissed')));
          },
          background: Container(color: Colors.red),
          //child: ListTile(title: Text('$note')),
          child: NoteCardWidget(note: note, index: index),
        );

        return GestureDetector(
          onTap: () async {
            await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => NoteDetailPage(noteId: note.id!),
            ));

            refreshNotes();
          },
          child: NoteCardWidget(note: note, index: index),
        );
      },
    );
}