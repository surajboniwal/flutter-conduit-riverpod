import 'package:conduit/app/features/home/application/events/article_event.dart';
import 'package:conduit/app/features/home/application/notifiers/article_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../data/models/article.dart';

class ArticleTile extends StatelessWidget {
  const ArticleTile({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
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
            Consumer(
              builder: (context, ref, child) {
                return GestureDetector(
                  onTap: () {
                    if (article.favorited) {
                      ref.read(ArticleNotifier.provide.notifier)(
                          ArticleEvent.favourite(article));
                    } else {
                      ref.read(ArticleNotifier.provide.notifier)(
                          ArticleEvent.unfavourite(article));
                    }
                  },
                  child: Icon(
                    article.favorited
                        ? Icons.bookmark
                        : Icons.bookmark_add_outlined,
                    size: 22.0,
                    color: Colors.grey,
                  ),
                );
              },
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
  }
}
