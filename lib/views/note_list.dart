import 'package:flutter/material.dart';
import 'package:flutter_rest_crud/models/note_for_listing.dart';
import 'package:flutter_rest_crud/views/note_delete.dart';
import 'package:flutter_rest_crud/views/note_modify.dart';

final notes = [
  new NoteForListing(
    noteId: "1",
    createDateTime: DateTime.now(),
    lastestEditDateTime: DateTime.now(),
    noteTile: "Note1",
  ),
  new NoteForListing(
    noteId: "2",
    createDateTime: DateTime.now(),
    lastestEditDateTime: DateTime.now(),
    noteTile: "Note2",
  ),
  new NoteForListing(
    noteId: "3",
    createDateTime: DateTime.now(),
    lastestEditDateTime: DateTime.now(),
    noteTile: "Note3",
  ),
];

String formatDateTime(DateTime dateTime) {
  return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
}

class NoteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Notes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => NoteModify()));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
          separatorBuilder: (_, __) => Divider(
                height: 1.0,
                color: Colors.green,
              ),
          itemBuilder: (_, index) {
            return Dismissible(
              key: ValueKey(notes[index].noteId),
              direction: DismissDirection.startToEnd,
              onDismissed: (direction) {},
              confirmDismiss: (direction) async {
                final result = await showDialog(
                  context: context,
                  builder: (context) => NoteDelete(),
                );
                print(result);
                return result;
              },
              background: Container(
                color: Colors.red,
                padding: EdgeInsets.only(left: 16.0),
                child: Align(
                  child: Icon(Icons.delete,color: Colors.white,),
                  alignment: Alignment.centerLeft,
                ),
              ),
              child: ListTile(
                title: Text(
                  notes[index].noteTile,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                subtitle: Text(
                    'Last edit on ${formatDateTime(notes[index].lastestEditDateTime)}'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => NoteModify(
                                noteId: notes[index].noteId,
                              )));
                },
              ),
            );
          },
          itemCount: notes.length),
    );
  }
}
