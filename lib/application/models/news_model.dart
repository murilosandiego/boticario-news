import 'package:boticario_news/application/models/message_model.dart';
import 'package:boticario_news/application/models/user_model.dart';
import 'package:boticario_news/domain/entities/news_entity.dart';

class NewsModel extends NewsEntity {
  NewsModel({
    this.user,
    this.message,
  });

  final UserModel user;
  final MessageModel message;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        user: UserModel.fromJson(json["user"]),
        message: MessageModel.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "message": message.toJson(),
      };
}
