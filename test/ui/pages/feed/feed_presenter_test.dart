import 'package:boticario_news/domain/usecases/load_news.dart';
import 'package:boticario_news/ui/pages/feed/feed_presenter.dart';
import 'package:boticario_news/ui/pages/feed/news_viewmodel.dart';

import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../mocks/mocks.dart';

class LoadNewsSpy extends Mock implements LoadNews {}

void main() {
  LoadNewsSpy loadNews;
  FeedPresenter sut;

  mockSuccess() => when(loadNews.load()).thenAnswer((_) async => newsList);

  setUp(() {
    loadNews = LoadNewsSpy();
    sut = FeedPresenter(loadNews: loadNews);
    mockSuccess();
  });

  test('Should call loadNews on loadData', () async {
    await sut.load();

    verify(loadNews.load()).called(1);
  });

  test('Should set value returned to the NewsViewModel', () async {
    await sut.load();

    expect(sut.news, [
      NewsViewModel(
          message: newsList[0].message.content,
          date: '20/02/2020',
          user: newsList[0].user.name),
      NewsViewModel(
          message: newsList[1].message.content,
          date: '14/08/2018',
          user: newsList[1].user.name)
    ]);
  });
}
