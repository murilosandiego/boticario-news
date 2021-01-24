import 'package:boticario_news/domain/entities/post_entity.dart';
import 'package:meta/meta.dart';

abstract class SavePost {
  Future<PostEntity> save({@required String message, int postId});
}
