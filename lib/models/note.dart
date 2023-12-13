// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Note {
  final int noteId;
  final String title;
   dynamic content;
  final DateTime createdTime;
   DateTime updatedTime;

  Note({
    required this.noteId,
    required this.content,
    required this.title,
    required this.createdTime,
    required this.updatedTime,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'noteId': noteId,
      'title': title,
      'content': content,
      'createdTime': createdTime.millisecondsSinceEpoch,
      'updatedTime': updatedTime.millisecondsSinceEpoch,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    //var content = map['content']!=''? jsonDecode(map['content']):'';
    return Note(
      noteId: map['noteId'] as int,
      title: map['title'] as String,
      content: map['content'],
      createdTime: DateTime.fromMillisecondsSinceEpoch(map['createdTime'] as int),
      updatedTime: DateTime.fromMillisecondsSinceEpoch(map['updatedTime'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(json.decode(source) as Map<String, dynamic>);
}
