import 'package:meta/meta.dart' show required;

import '../../domain/entities/account.dart';

class AccountModel extends Account {
  final String token;

  AccountModel({@required this.token});

  factory AccountModel.fromJson(json) => AccountModel(
        token: json["token"],
      );
}
