import 'dart:convert';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_muse/app/locator.dart';
import 'package:note_muse/models/note.dart';
import 'package:note_muse/services/editing.service.dart';
import 'package:note_muse/services/state_services/user_service.dart';

class EditingState {
  var currentNote;
  var noteType = '';
  var noteId = 0;
  var createdTime;
  var updatedTime;
  var content = '';
  var loading = false;
  var noteList = <int, Note>{};

  EditingState copyWith({
    var noteType,
    var noteList,
    var createdTime,
    var updatedTime,
    var content,
    var currentNote,
    var loading,
  }) {
    return EditingState()
      ..currentNote = currentNote ?? this.currentNote
      ..noteType = noteType ?? this.noteType
      ..createdTime = createdTime ?? this.createdTime
      ..updatedTime = updatedTime ?? this.updatedTime
      ..content = content ?? this.content
      ..loading = loading ?? this.loading
      ..noteList = noteList ?? this.noteList;
  }
}

class EditingProvider extends StateNotifier<EditingState> {
  EditingProvider() : super(EditingState()) {
    _init();
  }
  final _service = EditingService();
  final _locator = locator<UserService>();
  _setState(EditingState newState) {
    state = newState;
  }

  _init() async {
    // get a list of notes from a backend.
    var notes = await _service.getWorkspaces(_locator.userDocId);
    Map<int, Note> notesList = state.noteList;
    for (var element in notes) {
      Note newNote = Note.fromMap(element);
      notesList[newNote.noteId] = newNote;
    }
    _setState(state.copyWith(noteList: notesList));
  }

  updateCurrentContent(var content, var updatedTime) {
    _setState(state.copyWith());
  }

  randomeIdGenerator() {
    final random = Random();
    int min = 100;
    int max = 100000;
    int randomId = 0;
    do {
      randomId = min + random.nextInt(max - min + 1);
    } while (state.noteList.containsKey(randomId));
    return randomId;
  }

  // addNote(Note note) {
  //   Map<int, Note> notes = state.noteList;
  //   int noteId = state.noteId == 0 ? randomeIdGenerator() : state.noteId;
  //   notes[noteId] = note;
  //   _setState(state.copyWith(noteList: notes));
  // }

  creatWorkSpace(String title) {
    _setState(state.copyWith(loading: true));
    String uid = _locator.userDocId;
    int noteId = randomeIdGenerator();
    Note newNote = Note(
        title: title,
        content: '[]',
        createdTime: DateTime.now(),
        updatedTime: DateTime.now(),
        noteId: noteId);
    _service.creatNewWorkspace(newNote, uid);
    var notes = state.noteList;
    notes[noteId] = newNote;
    _setState(state.copyWith(
      noteList: notes,
      currentNote: newNote,
      loading: false,
    ));
  }

  void updateNote(Note note, var quillController) {
    final json = jsonEncode(quillController.document.toDelta().toJson());
    note.content=json;
    note.updatedTime = DateTime.now();
     String uid = _locator.userDocId;
    _service.updateWorkspace(note, uid);
  }

  static final provider = StateNotifierProvider<EditingProvider, EditingState>(
      (ref) => EditingProvider());
}
