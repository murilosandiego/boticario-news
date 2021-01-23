import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart' show required;

class AccountEntity extends Equatable {
  final String token;

  AccountEntity({@required this.token});

  @override
  List get props => [token];

  @override
  bool get stringify => true;
}
