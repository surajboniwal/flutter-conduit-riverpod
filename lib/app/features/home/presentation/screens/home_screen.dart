import 'package:conduit/app/shared/services/app_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const route = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FeatherIcons.bell,
              color: Colors.black,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(55.0),
          child: SizedBox(
            // color: Colors.black,
            height: 55.0,
            child: Consumer(
              builder: (context, ref, child) {
                final tags = ref.read(AppInfo.provider)['tags'] as List;
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: tags.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 12.0),
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: index == 0 ? Colors.black : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: Text(
                      tags[index],
                      style: TextStyle(
                          color: index == 0 ? Colors.grey.shade300 : null),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: const Text('Home'),
      ),
    );
  }
}
