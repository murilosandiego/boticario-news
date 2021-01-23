import '../../domain/entities/post_entity.dart';
import 'message_model.dart';
import 'user_model.dart';

class PostModel extends PostEntity {
  PostModel({
    this.user,
    this.message,
  });

  final UserModel user;
  final MessageModel message;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        user: UserModel.fromJson(json["user"]),
        message: MessageModel.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "message": message.toJson(),
      };
}
