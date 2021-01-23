import 'package:boticario_news/domain/entities/news_entity.dart';

abstract class LoadPosts {
  Future<List<NewsEntity>> load();
}
