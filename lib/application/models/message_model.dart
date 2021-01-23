import '../../domain/entities/message_entity.dart';

class MessageModel extends MessageEntity {
  MessageModel({
    this.content,
    this.createdAt,
  });

  final String content;
  final DateTime createdAt;

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        content: json["content"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "created_at": createdAt.toIso8601String(),
      };
}
