import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../application/notifiers/article_notifier.dart';
import '../widgets/home_appbar.dart';
import '../widgets/home_shimmer_loading.dart';

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
        bottom: const HomeAppBar(),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(ArticleNotifier.provide);
          return state.when(
            loading: () => const HomeShimmerLoading(),
            error: (error) => Center(child: Text(error)),
            empty: (tag) =>
                Center(child: Text('No data found for ${tag.toLowerCase()}')),
            data: (articles) => ListView.separated(
              padding: const EdgeInsets.all(16.0),
              itemCount: articles.length,
              separatorBuilder: (context, index) => const Divider(height: 36.0),
              itemBuilder: (context, index) {
                final article = articles[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 10.0,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(article.author.image),
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          article.author.username,
                          style: const TextStyle(
                            fontSize: 14.0,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      article.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 6.0),
                    Text(article.description),
                    const SizedBox(height: 6.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat('MMM dd, yyyy').format(article.createdAt),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          FeatherIcons.bookmark,
                          size: 18.0,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          '${article.favoritesCount}',
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
