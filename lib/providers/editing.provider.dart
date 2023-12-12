import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_muse/models/note.dart';

class EditingState {
  var noteType = '';
  var noteId = 0;
  var createdTime;
  var updatedTime;
  var content = '';
  var noteList = <int, Note>{};

  EditingState copyWith({
    var noteType,
    var noteList,
    var createdTime,
    var updatedTime,
    var content,
  }) {
    return EditingState()
      ..noteType = noteType ?? this.noteType
      ..createdTime = createdTime ?? this.createdTime
      ..updatedTime = updatedTime ?? this.updatedTime
      ..content = content ?? this.content
      ..noteList = noteList ?? this.noteList;
  }
}

class EditingProvider extends StateNotifier<EditingState> {
  EditingProvider() : super(EditingState());

  _setState(EditingState newState) {
    state = newState;
  }

  updateCurrentContent(var content, var updatedTime) {
    _setState(state.copyWith());
  }

  randomeIdGenerator() {
    final random = Random();
    int min = 100;
    int max = 10000;
    int randomId = 0;
    do {
      randomId = min + random.nextInt(max - min + 1);
    } while (state.noteList.containsKey(randomId));
    return randomId;
  }

  addNote(Note note) {
    Map<int, Note> notes = state.noteList;
    int noteId = state.noteId == 0 ? randomeIdGenerator() : state.noteId;
    notes[noteId] = note;
    _setState(state.copyWith(noteList: notes));
  }

  static final provider = StateNotifierProvider<EditingProvider, EditingState>(
      (ref) => EditingProvider());
}
