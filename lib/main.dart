import 'package:bsafe/screens/Home.dart';
import 'package:bsafe/screens/MapScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import './providers/Auth.dart';

import 'screens/LoginScreen.dart';
import 'screens/Welcome.dart';
import 'screens/VolunteerDashboard.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Auth()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'B.Safe',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(245, 245, 245, 1),
        ),
        routes: {
          "/": (context) {
            return LoginScreen();
          },
          "/home": (context) {
            return Welcome();
          },
          '/cats': (context) {
            return HomeScreen();
          },
          '/volunteer': (context) {
            return VolunteerDashboardScreen();
          },
          '/map': (context) {
            return MapScreen();
          }
        },
      ),
    );
  }
}
