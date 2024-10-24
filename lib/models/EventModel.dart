import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final String id; // Event ID
  final String name;
  final String description;
  final DateTime date; // Date as DateTime
  final String location;
  final String? imageUrl; // Optional field

  EventModel({
    required this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.location,
    this.imageUrl,
  });

  // Factory method to create an EventModel from Firestore document data
  factory EventModel.fromDocument(DocumentSnapshot doc) {
    return EventModel(
      id: doc.id,
      name: doc['name'],
      description: doc['description'],
      date: (doc['date'] as Timestamp).toDate(),
      location: doc['location'],
      imageUrl: doc['imageUrl'],
    );
  }
}
