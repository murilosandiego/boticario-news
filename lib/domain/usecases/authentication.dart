import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart' show required;

import '../entities/account.dart';

abstract class Authetication {
  Future<Account> auth(AuthenticationParams params);
}

class AuthenticationParams extends Equatable {
  final String email;
  final String secret;

  AuthenticationParams({
    @required this.email,
    @required this.secret,
  });

  @override
  List get props => [email, secret];
}
