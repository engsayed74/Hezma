import 'package:equatable/equatable.dart';

import 'register_model.dart';

class Data extends Equatable {
  final bool? status;
  final String? message;
  final Data? data;
  final String? token;

  const Data({this.status, this.message, this.data, this.token});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
        'token': token,
      };

  @override
  List<Object?> get props => [status, message, data, token];
}
