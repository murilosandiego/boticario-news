import 'package:boticario_news/domain/errors/domain_error.dart';
import 'package:boticario_news/domain/usecases/load_news.dart';
import 'package:boticario_news/domain/usecases/load_posts.dart';
import 'package:boticario_news/ui/helpers/ui_error.dart';
import 'package:boticario_news/ui/pages/feed/feed_presenter.dart';

import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../mocks/mocks.dart';

class LoadNewsSpy extends Mock implements LoadNews {}

class LoadPostsSpy extends Mock implements LoadPosts {}

void main() {
  LoadNewsSpy loadNews;
  LoadPostsSpy loadPosts;
  FeedPresenter sut;

  mockSuccess() => when(loadNews.load()).thenAnswer((_) async => newsList);

  mockSuccessPost() => when(loadPosts.load()).thenAnswer((_) async => newsList);

  mockError() => when(loadNews.load()).thenThrow(DomainError.unexpected);

  setUp(() {
    loadNews = LoadNewsSpy();
    loadPosts = LoadPostsSpy();

    sut = FeedPresenter(
      loadNews: loadNews,
      loadPosts: loadPosts,
    );
  });

  test('Should call loadNews on loadData', () async {
    mockSuccess();
    await sut.load();

    verify(loadNews.load()).called(1);
  });

  test('Should call loadPosts on loadData', () async {
    mockSuccessPost();
    await sut.load();

    verify(loadPosts.load()).called(1);
  });

  // test('Should set value returned to the NewsViewModel', () async {
  //   await sut.load();

  //   expect(sut.news, [
  //     NewsViewModel(
  //         message: newsList[0].message.content,
  //         date: '20/02/2020',
  //         user: newsList[0].user.name),
  //     NewsViewModel(
  //         message: newsList[1].message.content,
  //         date: '14/08/2018',
  //         user: newsList[1].user.name)
  //   ]);
  // });

  test('Should set UIError.unexpected if throws', () async {
    mockError();

    await sut.load();

    expect(sut.errorMessage, UIError.unexpected.description);
  });
}
