import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:twitter/src/screens/screens.dart';
import 'package:twitter/src/services/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SocketService(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomeScreen(),
          'status': (_) => StatusScreen(),
        },
      ),
    );
  }
}
