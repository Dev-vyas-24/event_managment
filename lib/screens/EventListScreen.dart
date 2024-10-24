import 'package:flutter/material.dart';
import '../widgets/event_card.dart';

class AllEventsScreen extends StatefulWidget {
  @override
  _AllEventsScreenState createState() => _AllEventsScreenState();
}

class _AllEventsScreenState extends State<AllEventsScreen> {
  final List<String> categories = ['Music', 'Dance', 'Comedy'];
  String selectedCategory = 'Music';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Events'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Search functionality here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Location and number of events
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rajkot | 20 Events',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Category Filter Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ChoiceChip(
                      label: Text(category),
                      selected: selectedCategory == category,
                      onSelected: (isSelected) {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            // Event Grid
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                  childAspectRatio: 0.7, // Adjust the aspect ratio for the cards
                ),
                itemCount: 4, // Number of events (replace with dynamic data)
                itemBuilder: (context, index) {
                  return EventCard(
                    imageUrl: 'assets/Background.png',
                    eventTitle: 'title',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class EventCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Event Image
//         Container(
//           height: 150,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             image: DecorationImage(
//               image: AssetImage('assets/event_image.png'), // Event poster image
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         SizedBox(height: 8),
//         // Event Title
//         Text(
//           'Music Concert',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 16,
//           ),
//         ),
//         SizedBox(height: 4),
//         // Event Date
//         Text(
//           '31 Dec',
//           style: TextStyle(color: Colors.grey[600]),
//         ),
//       ],
//     );
//   }
// }
