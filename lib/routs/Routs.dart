import 'package:event_managment/screens/EventDetailsScreen.dart';
import 'package:flutter/material.dart';
import '../screens/HomeContent.dart';
import '../screens/CreateEventScreen.dart';
import '../screens/EventListScreen.dart';
import '../screens/ProfileScreen.dart';

// // Define your routes here
// class AppRoutes {
//   static const String home = '/';
//   static const String createEvent = '/createEvent';
//   static const String eventList = '/eventList';
//   static const String profile = '/profile';

//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case home:
//         return MaterialPageRoute(builder: (_) => HomeContent());
//       case createEvent:
//         return MaterialPageRoute(builder: (_) => CreateEventScreen());
//       case eventList:
//         return MaterialPageRoute(builder: (_) => EventListScreen());
//       case profile:
//         return MaterialPageRoute(builder: (_) => ProfileScreen());
//       default:
//         return MaterialPageRoute(
//           builder: (_) => Scaffold(
//             body: Center(
//               child: Text('No route defined for ${settings.name}'),
//             ),
//           ),
//         );
//     }
//   }
// }

class AppRoutes {
  static const String homeScreen = '/home';
  static const String createEvent = '/createEvent';
  static const String eventList = '/eventList';
  static const String profile = '/profile';
  static const String eventDetail = '/eventDetail';

  static Map<String, WidgetBuilder> routes = {
    homeScreen: (context) => HomeScreen(),
    profile: (context) => ProfileScreen(),
    eventList:(context) => AllEventsScreen(),
    createEvent :(context) => CreateEventScreen(),
    eventDetail :(context) => EventDetailScreen()
  };
}
