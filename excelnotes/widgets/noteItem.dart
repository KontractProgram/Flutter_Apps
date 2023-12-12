import 'package:excelnotes/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/note.dart';
import 'notePage.dart';

class NoteItem extends StatelessWidget{
   final Note note;

  const NoteItem({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: darkGrey,
          margin: EdgeInsets.zero,
          child: ListTile(
            onTap: () {
              print('This is the list tile from noteItem');
              Navigator.push(context, MaterialPageRoute(builder: (context) => NotePage(note: note,)));
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5,),
            tileColor: Colors.white,
            title: Text(
              note.title!,
              style: TextStyle(
                color: lightGrey,
                fontSize: 20,
              ),
            ),
            subtitle: Text(
              note.content!,
              style: TextStyle(
                color: lightGrey,
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 2,
          color: lightGrey,
        )
      ],
    );
  }


}