import 'package:boticario_news/domain/usecases/load_news.dart';
import 'package:equatable/equatable.dart';

import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:meta/meta.dart';

import '../../../mocks/mocks.dart';

class FeedPresenter {
  final LoadNews loadNews;

  final _news = Rx<List<NewsViewModel>>();

  List<NewsViewModel> get news => _news.value;

  FeedPresenter({@required this.loadNews});

  load() async {
    final newsEntity = await loadNews.load();
    final resultMap = newsEntity
        .map(
          (news) => NewsViewModel(
            message: news.message.content,
            date: DateFormat('dd/MM/yyyy').format(news.message.createdAt),
            user: news.user.name,
          ),
        )
        .toList();

    _news.value = resultMap;
  }
}

class NewsViewModel extends Equatable {
  final String message;
  final String date;
  final String user;

  NewsViewModel(
      {@required this.message, @required this.date, @required this.user});

  @override
  List get props => [message, date, user];

  @override
  bool get stringify => true;
}

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
