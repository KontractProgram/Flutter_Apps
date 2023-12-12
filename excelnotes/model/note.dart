class Note{
  String? id;
  String? title;
  String? content;

  Note({
    required this.id,
    required this.title,
    required this.content,

});
  static List<Note> noteList(){
    return [
      Note(id: "1", title: 'My day', content: 'My day was the best ever'),
      Note(id: '2', title: 'School', content: 'School is as it is'),
    ];
  }
}