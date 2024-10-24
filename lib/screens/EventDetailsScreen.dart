import 'package:flutter/material.dart';

class EventDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image
            Stack(
              children: [
                Image.asset(
                  'assets/Background.png', // Update with your asset path
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 250,
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Event Category
                  Chip(
                    label: Text("Comedy Shows"),
                    backgroundColor: Colors.blue[100],
                  ),
                  SizedBox(height: 8),
                  
                  // Event Title
                  Text(
                    "That's So Viraj - With Friends A Live Comedy Show",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),

                  // Event Description
                  Text(
                    "A small stand-up comedy show typically features a single comedian or a lineup of comedians performing live in an intimate setting, such as a small club, bar, or coffee shop.",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),

                  // Event Details
                  Row(
                    children: [
                      Icon(Icons.access_time),
                      SizedBox(width: 8),
                      Text("1 hour 30 minutes"),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 8),
                      Text("Age Limit - 5yrs +"),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.language),
                      SizedBox(width: 8),
                      Text("Gujarati, Hindi"),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.theater_comedy),
                      SizedBox(width: 8),
                      Text("Comedy"),
                    ],
                  ),
                  Divider(height: 30),

                  // About The Event Section
                  Text(
                    "About The Event",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Get ready to laugh and enjoy the Gujarati way! Viraj Ghelani plans to tie the knot soon... Read More",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Event Closed Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: null, // Button disabled
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey, // Disabled button color
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
          child: Text(
            "Event Closed",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
