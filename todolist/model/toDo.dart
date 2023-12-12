class ToDo{
  String? id;
  String? toDoText;
  late bool isDone;

  ToDo({
    required this.id,
    required this.toDoText,
    this.isDone = false,
});
  static List<ToDo> toDoList(){
    return [
    ];
  }
}