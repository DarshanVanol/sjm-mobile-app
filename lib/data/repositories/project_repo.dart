import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sjm/data/models/project_model.dart';

class ProjectRepository {
  final _firestore = FirebaseFirestore.instance;
  final StreamController<ProjectCounts> _countController =
      StreamController<ProjectCounts>();

  Stream<ProjectCounts> get projectCountsStream => _countController.stream;

  Future<void> addProject(Map<String, dynamic> data) async {
    await _firestore.collection('projects').add(data);
  }

  Future<void> updateProject(Map<String, dynamic> data, String id) async {
    await _firestore.collection('projects').doc(id).update(data);
  }

  Future<void> deleteProject(String id) async {
    await _firestore.collection('projects').doc(id).delete();
  }

  // get stream of projects
  Stream<QuerySnapshot> getProjectsStream() {
    return _firestore.collection('projects').snapshots();
  }

  // get project
  Future<Project?> getProject(String id) async {
    final data = await _firestore.collection('projects').doc(id).get();
    if (data.exists) {
      return Project.fromJson(data.data()!);
    }
    return null;
  }

  void initializeCountStream() {
    _firestore
        .collection('projects')
        .snapshots()
        .listen((QuerySnapshot snapshot) {
      ProjectCounts counts = ProjectCounts();

      for (QueryDocumentSnapshot doc in snapshot.docs) {
        String status = doc['status'];

        switch (status) {
          case 'inprogress':
            counts.inProgressCount++;
            break;
          case 'completed':
            counts.completedCount++;
            break;
          case 'inreview':
            counts.inReviewCount++;
            break;
          case 'onhold':
            counts.onHoldCount++;
            break;
          // Add more cases if needed
        }
      }

      _countController.add(counts);
    });
  }

  void disposeCountStream() {
    _countController.close();
  }
}
