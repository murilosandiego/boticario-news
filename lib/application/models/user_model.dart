import 'package:boticario_news/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    this.name,
    this.profilePicture,
  });

  final String name;
  final String profilePicture;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        profilePicture: json["profile_picture"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "profile_picture": profilePicture,
      };

  @override
  List get props => [name, profilePicture];

  @override
  bool get stringify => true;
}