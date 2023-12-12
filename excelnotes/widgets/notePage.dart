import 'package:excelnotes/widgets/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/note.dart';
import 'noteAppBar.dart';

class NotePage extends StatelessWidget{
  final Note note;

  const NotePage({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NoteAppBar(),
      body: TextField(),
    );
  }
}