import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sjm/data/models/meeting_model.dart';

class MeetingRepository {
  final _firestore = FirebaseFirestore.instance;

  Future<void> addMeeting(Meeting meeting) async {
    await _firestore.collection('meetings').add(meeting.toMap());
  }

  Stream<List<Meeting>> getMeetings() {
    return _firestore.collection('meetings').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Meeting.fromSnapshot(doc.data()))
          .toList();
    });
  }
}
