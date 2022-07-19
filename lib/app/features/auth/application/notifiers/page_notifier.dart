import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthPageController extends StateNotifier<PageController> {
  AuthPageController(super.state);

  static final provider =
      StateNotifierProvider<AuthPageController, PageController>(
    (ref) => AuthPageController(
      PageController(),
    ),
  );

  void animate(int page) {
    state.animateToPage(page,
        duration: const Duration(milliseconds: 200), curve: Curves.easeOutExpo);
  }
}
