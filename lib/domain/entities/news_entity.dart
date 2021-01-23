import 'package:equatable/equatable.dart';

import 'message_entity.dart';
import 'user_entity.dart';

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
