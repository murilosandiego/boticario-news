import 'package:boticario_news/domain/entities/news_entity.dart';

abstract class LoadNews {
  Future<List<NewsEntity>> load();
}
