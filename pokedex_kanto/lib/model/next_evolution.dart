import 'package:equatable/equatable.dart';

class NextEvolution extends Equatable {
  late final String number;
  late final String name;

  NextEvolution.fromJson(Map<String, dynamic> json) {
    number = json['num'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['num'] = this.number;
    data['name'] = this.name;

    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [number, name];
}
