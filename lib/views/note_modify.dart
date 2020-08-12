import 'package:flutter/material.dart';

class NoteModify extends StatelessWidget {
  final String noteId;
  NoteModify({this.noteId});
  bool get isEditing => noteId != null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? "Edit Note" : "Create Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: "Note Title"),
            ),
            Container(
              height: 8.0,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Note Content"),
            ),
            Container(height: 16.0),
            SizedBox(
              width: double.infinity,
              height: 35.0,
              child: RaisedButton(
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
