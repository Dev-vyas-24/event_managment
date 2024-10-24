import 'package:flutter/material.dart';
import 'routs/Routs.dart';
// import 'widgets/EventPoster.dart';
import 'screens/HomeContent.dart';
import 'screens/CreateEventScreen.dart';
import 'screens/EventListScreen.dart';
import 'screens/ProfileScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(EventApp());
}

class EventApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: AppRoutes.routes, // Use AppRoutes for navigation
      initialRoute: AppRoutes.homeScreen, // Set the initial route
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _bottomItemIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CreateEventScreen(),
    AllEventsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.location_on, color: Colors.black),
        title: Text(
          'Rajkot',
          style: TextStyle(color: Colors.black),
        ),
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Event Banner
            Container(
              margin: EdgeInsets.all(16.0),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage('assets/Background.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Scrolling Banner Section
            Container(
              height: 100,
              margin: EdgeInsets.only(left: 16.0, bottom: 16.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3, // number of banners
                itemBuilder: (context, index) {
                  return Container(
                    width: 250,
                    margin: EdgeInsets.only(right: 16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage('assets/Background.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),

            // Today's Events Section Title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today's Event",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('See All'),
                  ),
                ],
              ),
            ),

            // Today's Events Grid
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.7,
              ),
              itemCount: 3, // number of event posters
              itemBuilder: (context, index) {
                return 
                   SingleChildScrollView(
                    child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, AppRoutes.eventDetail);
                  },
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage('assets/Background.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Music Concert',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newIndex) =>{
          if(newIndex == 1){
            Navigator.pushNamed(context, AppRoutes.createEvent),
            print("")
          }
        },
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
            icon: Icon(Icons.event),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// class HomeContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           // Event Banner
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ClipRRect(
//             borderRadius: BorderRadius.circular(8.0),
//             child: Image.asset(
//               'assets/Background.png', // Update with the correct image path
//               height: 150, // Fixed height for image
//               fit: BoxFit.cover,
//             ),
//           ),// Placeholder for banner
//           ),
//           // Today's Events Section
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('Today\'s Event', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                 TextButton(onPressed: () {}, child: Text('See All'))
//               ],
//             ),
//           ),
//           // Events Grid
//           GridView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 8,
//               mainAxisSpacing: 8,
//               childAspectRatio: 0.7,
//             ),
//             itemCount: 4, // Example count
//             itemBuilder: (context, index) {
//               return EventPoster();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class EventPoster extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           height: 150,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8.0),
//             image: DecorationImage(
//               image: NetworkImage('https://example.com/event_image.jpg'), // Placeholder for event image
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8.0),
//           child: Text('Music Concert', style: TextStyle(fontWeight: FontWeight.bold)),
//         ),
//         Text('31 Dec', style: TextStyle(color: Colors.grey)),
//       ],
//     );
//   }
// }

// class CreateEventScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Create Event Screen'),
//     );
//   }
// }

// class EventListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Events List Screen'),
//     );
//   }
// }

// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Profile Screen'),
//     );
//   }
// }
