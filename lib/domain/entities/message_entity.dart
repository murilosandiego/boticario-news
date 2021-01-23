import 'package:equatable/equatable.dart';

class MessageEntity implements Equatable {
  MessageEntity({
    this.content,
    this.createdAt,
  });

  final String content;
  final DateTime createdAt;

  @override
  List get props => [content, createdAt];

  @override
  bool get stringify => true;
}
