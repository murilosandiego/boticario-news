import 'package:boticario_news/domain/entities/message_entity.dart';
import 'package:boticario_news/domain/entities/user_entity.dart';

class NewsEntity {
  NewsEntity({
    this.user,
    this.message,
  });

  final UserEntity user;
  final MessageEntity message;
}
