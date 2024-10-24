import 'package:event_managment/routs/Routs.dart';
import 'package:event_managment/screens/EventListScreen.dart';
import 'package:flutter/material.dart';
import '../widgets/EventPoster.dart';
import '../widgets/event_card.dart';
import '../screens/CreateEventScreen.dart';
import '../screens/EventDetailsScreen.dart';
import '../screens/ProfileScreen.dart';
import '../controllers/event_controller.dart'; // Import your event controller
import '../models/EventModel.dart'; // Import the event model

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final EventController _eventController = EventController();
  Future<List<EventModel>>? _eventsFuture; // Future for event data

  @override
  void initState() {
    super.initState();
    _eventsFuture = _eventController.fetchAllEvents(); // Fetch events on initialization
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fun Starts Here', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.qr_code, color: Colors.black),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Rajkot',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<EventModel>>(
        future: _eventsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No events found.'));
          }

          final events = snapshot.data!;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Banner Section
                GestureDetector(
                  onTap: () => {
                    Navigator.pushNamed(context, AppRoutes.eventDetail)
                  },
                  child: Container(
                    height: 200,
                    child: PageView(
                      children: [
                        BannerImage('assets/Background.png'),
                        BannerImage('assets/Background.png'),
                      ],
                    ),
                  ),
                ),

                // Horizontal Scroll for Today's Events
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Today\'s Event',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.eventList);
                        },
                        child: Text('See All'),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      final event = events[index];
                      return EventCard(
                        imageUrl: event.imageUrl ?? 'assets/Background.png', // Use event image
                        eventTitle: event.name,
                        // Add other details as needed
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.redAccent,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Create Event',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateEventScreen()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AllEventsScreen()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          }
        },
      ),
    );
  }
}
