import 'package:equatable/equatable.dart';

class NextEvolution extends Equatable {
  late final String number;
  late final String name;

  NextEvolution(this.number, this.name);

  NextEvolution.fromJson(Map<String, dynamic> json) {
    number = json['num'] != null ? json['num']: 'nani';
    name = json['name']!= null ? json['name']: 'nani';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, String>();
    data['num'] = this.number;
    data['name'] = this.name;

    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [number, name];
}
