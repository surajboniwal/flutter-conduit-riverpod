import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/notifiers/page_notifier.dart';
import '../sections/login.dart';
import '../sections/register.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  static const String route = 'auth';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer(
          builder: (context, ref, child) {
            final controller = ref.read(AuthPageController.provider);
            return PageView(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                RegisterSection(),
                LoginSection(),
              ],
            );
          },
        ),
      ),
    );
  }
}
