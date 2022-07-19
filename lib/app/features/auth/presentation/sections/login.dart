import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/app_colors.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/auto_size_text.dart';
import '../../application/notifiers/page_notifier.dart';
import '../widgets/label_text_field.dart';

class LoginSection extends StatelessWidget {
  const LoginSection({Key? key}) : super(key: key);

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
              'Log in with email.',
              // maxLines: 1,
              style: GoogleFonts.ibarraRealNova(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 18.0),
          LabelTextField(
            label: 'Your email',
            controller: TextEditingController(),
          ),
          const SizedBox(height: 18.0),
          LabelTextField(
            label: 'Your password',
            controller: TextEditingController(),
          ),
          const SizedBox(height: 36.0),
          AppButton(
            label: 'Login',
            onTap: () {},
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
                      text: 'Don\'t have an account? ',
                    ),
                    TextSpan(
                      text: 'Register',
                      style: const TextStyle(color: AppColors.secondary),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          controllerNotifier.animate(0);
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
