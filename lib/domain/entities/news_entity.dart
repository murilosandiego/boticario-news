import 'package:boticario_news/domain/entities/message_entity.dart';
import 'package:boticario_news/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

class NewsEntity implements Equatable {
  NewsEntity({
    this.user,
    this.message,
  });

  final UserEntity user;
  final MessageEntity message;

  @override
  List get props => [user, message];

  @override
  bool get stringify => true;
}
