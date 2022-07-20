import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/app_colors.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/auto_size_text.dart';
import '../../application/notifiers/auth_notifier.dart';
import '../../application/notifiers/page_notifier.dart';
import '../widgets/label_text_field.dart';

class RegisterSection extends StatelessWidget {
  RegisterSection({Key? key}) : super(key: key);

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            child: Consumer(
              builder: (context, ref, child) {
                final notifier = ref.read(AuthNotifier.provider.notifier);
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
            ),
            builder: (context, ref, child) {
              final state = ref.watch(AuthNotifier.provider);
              return state.maybeWhen(
                loading: () => const AppButton(
                  loading: true,
                ),
                orElse: () {
                  return child!;
                },
              );
            },
          ),
          const SizedBox(height: 12.0),
          Consumer(
            builder: (context, ref, child) {
              final controllerNotifier =
                  ref.read(AuthPageController.provider.notifier);
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
                        ..onTap = () {
                          controllerNotifier.animate(1);
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
