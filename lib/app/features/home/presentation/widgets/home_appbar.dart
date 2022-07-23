import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/presentation/extensions/string.dart';
import '../../../../shared/services/app_info.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(55.0),
      child: SizedBox(
        height: 55.0,
        child: Consumer(
          builder: (context, ref, child) {
            final tags = ref.read(AppInfo.provider)['tags'] as List;
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: tags.length + 1,
              separatorBuilder: (context, index) => const SizedBox(width: 12.0),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const TagWidget(label: 'Following', selected: true);
                }
                index--;
                return TagWidget(label: tags[index], selected: false);
              },
            );
          },
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55.0);
}

class TagWidget extends StatelessWidget {
  const TagWidget({
    Key? key,
    required this.label,
    required this.selected,
  }) : super(key: key);

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: selected ? Colors.black : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Text(
        label.toString().sentenceCase,
        style: TextStyle(color: selected ? Colors.grey.shade300 : null),
      ),
    );
  }
}
