import 'package:mesa_news/domain/entities/account.dart';
import 'package:meta/meta.dart' show required;

class AccountModel extends Account {
  final String token;

  AccountModel({@required this.token});

  factory AccountModel.fromJson(json) => AccountModel(
        token: json["token"],
      );
}
