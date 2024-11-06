import 'package:equatable/equatable.dart';

class TermsModel extends Equatable {
  final String? name;
  final String? value;

  const TermsModel({this.name, this.value});

  factory TermsModel.fromJson(Map<String, dynamic> json) => TermsModel(
        name: json['name'] as String?,
        value: json['value'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'value': value,
      };

  @override
  List<Object?> get props => [name, value];
}
