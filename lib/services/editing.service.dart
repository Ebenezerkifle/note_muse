import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_muse/models/note.dart';

class EditingService {
  //create a workspace
  creatNewWorkspace(Note note, String uid) {
    Map<String, dynamic> data = note.toMap();
    data['uid'] = uid;
    FirebaseFirestore.instance
        .collection("workspaces")
        .add(data)
        .then((DocumentReference doc) {
      return true;
    }).catchError((_) {
      return false;
    });
  }

  //update the workspace
  void updateWorkspace(Note note, String uid) {
    Map<String, dynamic> data = note.toMap();
    data['uid'] = uid;
    FirebaseFirestore.instance
        .collection("workspaces")
        .add(data)
        .then((DocumentReference doc) {
      return true;
    }).catchError((_) {
      return false;
    });
  }

  // get a workspace
  getWorkspaces(String uid) async {
    //Get docs from a collection reference
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("workspaces")
        .where('uid', isEqualTo: uid)
        .get()
        .timeout(const Duration(seconds: 10), onTimeout: () {
      return {} as QuerySnapshot<Map<String, dynamic>>;
    });

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    return allData;
  }
}
