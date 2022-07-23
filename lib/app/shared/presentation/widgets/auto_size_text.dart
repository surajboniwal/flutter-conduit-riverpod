import 'package:flutter/widgets.dart';

class AutoSizeText extends StatelessWidget {
  final double? width;
  final Text child;

  const AutoSizeText({Key? key, this.width, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      child: FittedBox(
        child: child,
      ),
    );
  }
}
