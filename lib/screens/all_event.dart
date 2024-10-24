import 'package:flutter/material.dart';

class AllEventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('All Events', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Handle search functionality
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.grey),
                SizedBox(width: 4),
                Text('Rajkot | 20 Events', style: TextStyle(color: Colors.grey)),
              ],
            ),
            SizedBox(height: 20),
            _buildCategoryButtons(),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.65, // Aspect ratio for images
                ),
                itemCount: 8, // Change this to your event count
                itemBuilder: (context, index) {
                  return _buildEventCard(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButtons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildCategoryButton('Music'),
          _buildCategoryButton('Dance'),
          _buildCategoryButton('Comedy'),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: OutlinedButton(
        onPressed: () {
          // Handle category selection
        },
        child: Text(label),
      ),
    );
  }

  Widget _buildEventCard(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/Background.png'), // Add your image here
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Music Concert',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
