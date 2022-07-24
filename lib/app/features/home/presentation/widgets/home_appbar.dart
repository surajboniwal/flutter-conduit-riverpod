import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/presentation/extensions/string.dart';
import '../../application/notifiers/tags_notifier.dart';

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
            final tags = ref.read(TagNotifier.provider.notifier).tags;
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: tags.length,
              separatorBuilder: (context, index) => const SizedBox(width: 12.0),
              itemBuilder: (context, index) {
                return TagWidget(
                  label: tags[index],
                );
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
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final selectedTag = ref.watch(TagNotifier.provider);
        final notifier = ref.read(TagNotifier.provider.notifier);
        bool selected = selectedTag == label;
        return GestureDetector(
          onTap: () {
            notifier.updateState(label);
          },
          child: Container(
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
          ),
        );
      },
    );
  }
}
