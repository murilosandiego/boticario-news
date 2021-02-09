import 'package:boticario_news/ui/pages/feed/post_viewmodel.dart';
import 'package:equatable/equatable.dart';

abstract class FeedState extends Equatable {}

class FeedInitial extends FeedState {
  @override
  List<Object> get props => [];
}

class FeedLoading extends FeedState {
  @override
  List<Object> get props => [];
}

class FeedLoaded extends FeedState {
  final List<NewsViewModel> news;

  FeedLoaded(this.news);
  @override
  List<Object> get props => [news];
}

class FeedError extends FeedState {
  final String message;

  FeedError(this.message);
  @override
  List<Object> get props => [message];
}
