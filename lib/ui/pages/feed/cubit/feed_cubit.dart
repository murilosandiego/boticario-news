import 'package:bloc/bloc.dart';
import 'package:boticario_news/domain/entities/post_entity.dart';
import 'package:boticario_news/domain/usecases/load_news.dart';
import 'package:boticario_news/domain/usecases/load_posts.dart';
import 'package:boticario_news/domain/usecases/remove_post.dart';
import 'package:boticario_news/domain/usecases/save_post.dart';
import 'package:boticario_news/main/pages/app_pages.dart';
import 'package:boticario_news/ui/helpers/ui_error.dart';
import 'package:boticario_news/ui/helpers/user_session.dart';
import 'package:boticario_news/ui/pages/feed/cubit/feed_state.dart';
import 'package:boticario_news/ui/pages/feed/post_viewmodel.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:localstorage/localstorage.dart';
import 'package:meta/meta.dart';

class FeedCubit extends Cubit<FeedState> {
  final LoadNews loadNews;
  final LoadPosts loadPosts;
  final SavePost savePost;
  final RemovePost removePost;
  final LocalStorage localStorage;
  final UserSession userSession;

  FeedCubit({
    @required this.loadNews,
    @required this.loadPosts,
    @required this.savePost,
    @required this.removePost,
    this.localStorage,
    this.userSession,
  }) : super(FeedLoading());

  Future<void> load() async {
    try {
      final newsBoticario = await loadNews.load();
      final postsUsers = await loadPosts.load();

      newsBoticario.addAll(postsUsers);

      final sortedResult = newsBoticario
        ..sort(
          (a, b) => b.message.createdAt.compareTo(a.message.createdAt),
        );

      final news = sortedResult.map((post) => toViewModel(post)).toList();

      emit(FeedLoaded(news));
    } catch (error) {
      emit(FeedError(UIError.unexpected.description));
    }
  }

  void logoutUser() async {
    emit(FeedLoading());
    await localStorage.clear();
    userSession.clear();
    Get.offAllNamed(AppPages.welcome);
  }

  NewsViewModel toViewModel(PostEntity post) {
    return NewsViewModel(
      id: post?.id,
      message: post?.message?.content,
      date: DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt_BR')
          .format(post?.message?.createdAt),
      user: post?.user?.name,
      userId: post?.user?.id,
    );
  }
}
