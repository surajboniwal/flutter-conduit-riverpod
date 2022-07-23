import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/core/local_storage.dart';
import 'app/core/route_manager.dart';
import 'app/features/auth/presentation/screens/auth_screen.dart';
import 'app/features/home/presentation/screens/home_screen.dart';

String initialRoute = AuthScreen.route;
Future<void> main() async {
  await Hive.initFlutter();
  await Future.forEach(Storage.values, (Storage val) async {
    await val.openBox();
  });

  if (Storage.config.get(StorageKey.token) != null) {
    initialRoute = HomeScreen.route;
  }

  runApp(const ProviderScope(child: ConduitApp()));
}

class ConduitApp extends StatelessWidget {
  const ConduitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conduit',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        primaryColor: Colors.black,
      ),
      initialRoute: initialRoute,
      onGenerateRoute: RouteManager.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
