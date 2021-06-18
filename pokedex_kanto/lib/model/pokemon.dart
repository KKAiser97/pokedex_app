import 'package:equatable/equatable.dart';

import 'next_evolution.dart';

class Pokemon extends Equatable {
  late final int id;
  late final String number;
  late final String name;
  late final String img;
  late final List<String> type;
  late final String height;
  late final String weight;
  late final String egg;
  late final String spawnChance;
  late final String avgSpawns;
  late final String spawnTime;
  late final List<double> multipliers;
  late final List<String> weaknesses;
  late final List<NextEvolution> nextEvolution;

  Pokemon(
    this.id,
    this.number,
    this.name,
    this.img,
    this.type,
    this.height,
    this.weight,
    this.egg,
    this.spawnChance,
    this.avgSpawns,
    this.spawnTime,
    this.multipliers,
    this.weaknesses,
    this.nextEvolution,
  );

  // factory Pokemon.fromJson(Map<String, dynamic> json) {
  //   return Pokemon(
  //     id: json['id'],
  //     number: json['num'],
  //     name: json['name'],
  //     img: json['img'],
  //     type: json['type'].cast<String>(),
  //     height: json['height'],
  //     weight: json['weight'],
  //     egg: json['egg'],
  //     spawnChance: json['spawn_chance'].toString(),
  //     avgSpawns: json['avg_spawns'].toString(),
  //     spawnTime: json['spawn_time'],
  //     multipliers: json['multipliers']?.cast<double>(),
  //     weaknesses: json['weaknesses'].cast<String>(),
  //     nextEvolution: json['next_evolution'] != null
  //         ? json['next_evolution'].cast<NextEvolution>()
  //         : '',
  //   );
  // }

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['num'];
    name = json['name'];
    img = json['img'];
    type = json['type'].cast<String>();
    height = json['height'];
    weight = json['weight'];
    egg = json['egg'];
    spawnChance = json['spawn_chance'].toString();
    avgSpawns = json['avg_spawns'].toString();
    spawnTime = json['spawn_time'];
    multipliers = json['multipliers'] != null ? json['multipliers'].cast<double>() : [0.0];
    weaknesses = json['weaknesses'].cast<String>();
    if (json['next_evolution'] != null) {
      nextEvolution = [];
      json['next_evolution'].forEach((v) {
        nextEvolution.add(NextEvolution.fromJson(v));
      });
    } else{
      nextEvolution = [NextEvolution('5.5','nina'), NextEvolution('5.5','nina')];
    }

    //nextEvolution = json['next_evolution'] != null ? json['next_evolution'] : [NextEvolution('5.5','nina')];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['num'] = this.number;
    data['name'] = this.name;
    data['img'] = this.img;
    data['type'] = this.type;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['egg'] = this.egg;
    data['spawn_chance'] = this.spawnChance;
    data['avg_spawns'] = this.avgSpawns;
    data['spawn_time'] = this.spawnTime;
    data['multipliers'] = this.multipliers;
    data['weaknesses'] = this.weaknesses;
    data['next_evolution'] = this.nextEvolution.map((v) => v.toJson()).toList();

    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        number,
        name,
        img,
        type,
        height,
        weight,
        egg,
        spawnChance,
        avgSpawns,
        spawnTime,
        multipliers,
        weaknesses,
        nextEvolution,
      ];
}
