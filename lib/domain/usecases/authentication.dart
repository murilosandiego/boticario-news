import 'package:meta/meta.dart' show required;

import '../entities/account.dart';

abstract class Authetication {
  Future<Account> auth(AuthenticationParams params);
}

class AuthenticationParams {
  final String email;
  final String secret;

  AuthenticationParams({
    @required this.email,
    @required this.secret,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AuthenticationParams && o.email == email && o.secret == secret;
  }

  @override
  int get hashCode => email.hashCode ^ secret.hashCode;
}
