import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_news_app/src/features/news/data/repo/news_repo.dart';
import 'package:riverpod_news_app/src/features/news/domain/newsmodel.dart';

final newsRepoProvider = Provider((ref) => NewsRepo());
final selectedNews = StateProvider(
  (ref) => NewsModel(
    pubDate: '2023-05-07T01:09:39Z',
    sectionName: 'Australia news',
    type: 'liveblog',
    title: 'Australia news live: Chalmers confirms energy rebates for millions, relief for all ages amid reports of broader jobseeker changes',
    webUrl: 'https://www.theguardian.com/australia-news/live/2023/may/07/jim-chalmers-federal-budget-petroleum-resource-rent-tax-king-charles-coronation-reactions',
  ),
);
final asyncNewsProvider =
    AsyncNotifierProvider<AsyncNewsNotifier, List<NewsModel>>(
        () => AsyncNewsNotifier());

class AsyncNewsNotifier extends AsyncNotifier<List<NewsModel>> {
  @override
  FutureOr<List<NewsModel>> build() {
    return getNews();
  }

  Future<List<NewsModel>> getNews() async {
    state = const AsyncLoading();
    List<NewsModel> list = [];
    state = await AsyncValue.guard(() async {
      list = await ref.read(newsRepoProvider).getNews();
      return list;
    });
    return list;
  }
}
