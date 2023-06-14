
import 'package:equatable/equatable.dart';

class UserService extends Equatable {
  // final int userId;
  final String firstName;
  final String phoneNumber;
  final String token;
  // final String email;
  // final String area;
  // final String address;

  UserService(
      {
        // required this.userId,
        required this.firstName,
        required this.phoneNumber,
        required this.token,
        // required this.email,
        // required this.area,
        // required this.address,
        });

  static UserService fromJson(Map<String, dynamic> json) {
    return UserService( firstName: json['firstName'], phoneNumber:json['mobile'],token: json['token']);
  }

  @override
  List<Object?> get props => [firstName,phoneNumber];
}
