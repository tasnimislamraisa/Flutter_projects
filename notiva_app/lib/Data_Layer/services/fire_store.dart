import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService{

  //TODO get collection of notes
  final CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  //TODO Create
Future<void> addNote(String note) {
  return notes.add({
    'note' :note,
    'timestamp' : Timestamp.now(),
  });
}

  //TODO Read
Stream<QuerySnapshot> geNotesStream(){
  final noteStream = notes.orderBy('timestamp',descending:true).snapshots();
  return noteStream;
}

  //TODO Update
  Future<void> updateNote(String docId,String newNote) {
    return notes.doc(docId).update(({
      'note' :newNote,
      'timestamp':Timestamp.now(),
    }));
  }

  //TODO Delete
  Future<void> deleteNote(String docId) async {
    return notes.doc(docId).delete();
  }

}