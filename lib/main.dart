import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/core/route_manager.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  //Ibarra Real Nova

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conduit',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        primaryColor: Colors.black,
      ),
      onGenerateRoute: RouteManager.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
