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

  factory PostModel.fromJsonApiPosts(Map<String, dynamic> json) => PostModel(
        user: json["users_permissions_user"] == null
            ? null
            : UserModel(name: json["users_permissions_user"]["username"]),
        message: MessageModel(
            content: json["message"]["content"],
            createdAt: DateTime.parse(json["created_at"])),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "message": message.toJson(),
      };
}
