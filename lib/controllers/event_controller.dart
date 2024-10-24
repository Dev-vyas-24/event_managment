import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/EventModel.dart'; // Update this path according to your project structure

class EventController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to fetch all events
  Future<List<EventModel>> fetchAllEvents() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('events').get();
      return snapshot.docs.map((doc) => EventModel.fromDocument(doc)).toList();
    } catch (e) {
      print('Error fetching events: $e');
      return [];
    }
  }
}
