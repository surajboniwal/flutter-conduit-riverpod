import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/app_colors.dart';
import '../../../../shared/presentation/widgets/app_button.dart';
import '../../../../shared/presentation/widgets/auto_size_text.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../application/notifiers/auth_notifier.dart';
import '../../application/notifiers/page_notifier.dart';
import '../../application/states/auth_state.dart';
import '../widgets/label_text_field.dart';

class RegisterSection extends ConsumerWidget {
  RegisterSection({Key? key}) : super(key: key);

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void clean() {
    usernameController.text = '';
    emailController.text = '';
    passwordController.text = '';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AuthState>(
      AuthNotifier.provider,
      (previous, next) {
        next.whenOrNull(
          success: (data) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Account created successfully')),
            );
            Navigator.of(context).pushReplacementNamed(HomeScreen.route);
            clean();
          },
        );
      },
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        children: [
          const SizedBox(height: 32.0),
          LayoutBuilder(
            builder: (context, constraints) {
              return AutoSizeText(
                width: constraints.maxWidth * 0.4,
                child: Text(
                  'Conduit',
                  style: GoogleFonts.ibarraRealNova(
                    fontSize: 36.0,
                    fontWeight: FontWeight.w900,
                    color: AppColors.secondary,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 12.0),
          AutoSizeText(
            child: Text(
              'Sign up with email.',
              // maxLines: 1,
              style: GoogleFonts.ibarraRealNova(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 18.0),
          Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(AuthNotifier.provider);
              return state.maybeWhen(
                error: (email, password, username) => LabelTextField(
                  label: 'Your username',
                  error: username,
                  controller: usernameController,
                ),
                orElse: () => LabelTextField(
                  label: 'Your username',
                  controller: usernameController,
                ),
              );
            },
          ),
          const SizedBox(height: 18.0),
          Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(AuthNotifier.provider);
              return state.maybeWhen(
                error: (email, password, username) => LabelTextField(
                  label: 'Your email',
                  error: email,
                  controller: emailController,
                ),
                orElse: () => LabelTextField(
                  label: 'Your email',
                  controller: emailController,
                ),
              );
            },
          ),
          const SizedBox(height: 18.0),
          Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(AuthNotifier.provider);
              return state.maybeWhen(
                error: (email, password, username) => LabelTextField(
                  label: 'Your password',
                  error: password,
                  controller: passwordController,
                ),
                orElse: () => LabelTextField(
                  label: 'Your password',
                  controller: passwordController,
                ),
              );
            },
          ),
          const SizedBox(height: 36.0),
          Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(AuthNotifier.provider);
              final notifier = ref.read(AuthNotifier.provider.notifier);
              return state.maybeWhen(
                loading: () => const AppButton(
                  loading: true,
                ),
                orElse: () {
                  return AppButton(
                    label: 'Create account',
                    onTap: () {
                      notifier(
                        AuthEvent.register(
                          usernameController.text,
                          emailController.text,
                          passwordController.text,
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
          const SizedBox(height: 12.0),
          Consumer(
            builder: (context, ref, child) {
              final controllerNotifier =
                  ref.read(AuthPageController.provider.notifier);
              final authController = ref.read(AuthNotifier.provider.notifier);
              return RichText(
                text: TextSpan(
                  style: GoogleFonts.poppins(color: Colors.black),
                  children: [
                    const TextSpan(
                      text: 'Already have an account? ',
                    ),
                    TextSpan(
                      text: 'Sign in',
                      style: const TextStyle(color: AppColors.secondary),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          await controllerNotifier.animate(1);
                          authController(const AuthEvent.initial());
                          clean();
                        },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
