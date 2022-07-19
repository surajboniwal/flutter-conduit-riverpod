import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    this.label,
    this.onTap,
    this.loading = false,
  })  : assert(loading == false ? label != null : loading),
        super(key: key);

  final String? label;
  final VoidCallback? onTap;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(100),
            ),
            child: loading
                ? const CupertinoActivityIndicator(color: Colors.white)
                : Text(
                    label!,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.3,
                      color: Colors.white,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
