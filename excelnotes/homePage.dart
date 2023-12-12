import 'package:excelnotes/constants/colors.dart';
import 'package:excelnotes/model/note.dart';
import 'package:excelnotes/widgets/appBar.dart';
import 'package:excelnotes/widgets/noteItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  HomePage({Key? key}): super(key: key);
  final notes = Note.noteList();


  Widget build(BuildContext context){
    const String num = "23";
    const n = 30;
    return Scaffold(
      appBar: MainAppBar(),
      body: Stack(
        children: [
          Container(
            color: Colors.black,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      searchBox(),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 20,
                      ),
                      for(Note note in notes)
                        NoteItem(note: note),
                      for(Note note in notes)
                        NoteItem(note: note),
                      for(Note note in notes)
                        NoteItem(note: note),
                      for(Note note in notes)
                        NoteItem(note: note),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: darkGrey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width*0.58,
                          height: 20,
                          alignment: Alignment.centerRight,
                          child: Text(num + ' notes',
                            style: TextStyle(
                                color: Colors.white,
                            ),
                          ),
                        ),
                      ElevatedButton(
                        onPressed: () { print("add note"); },
                        child: Icon(Icons.add,
                          color: Colors.white,
                          size: 40,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: darkGrey,
                          shadowColor: Color(0x00ffffff),
                          elevation: 15,
                        ),
                      ),
                    ],
                  ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget searchBox() {
    return Container(
      decoration: BoxDecoration(
        color: darkGrey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: lightGrey,
            size: 25,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 30,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: lightGrey),
        ),
      ),
    );
  }
}

