import 'package:meta/meta.dart' show required;

import '../../domain/entities/account_entity.dart';

class AccountModel extends AccountEntity {
  final String token;

  AccountModel({@required this.token});

  factory AccountModel.fromJson(json) => AccountModel(
        token: json["jwt"],
      );
}
