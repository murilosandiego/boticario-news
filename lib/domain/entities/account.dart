import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart' show required;

class Account extends Equatable {
  final String token;

  Account({@required this.token});

  @override
  List get props => [token];

  @override
  bool get stringify => true;
}
