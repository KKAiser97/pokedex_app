import 'next_evolution.dart';

class Pokemon {
  late int id;
  late String number;
  late String name;
  late String img;
  late List<String> type;
  late String height;
  late String weight;
  late String egg;
  late String spawnChance;
  late String avgSpawns;
  late String spawnTime;
  late List<double> multipliers;
  late List<String> weaknesses;
  late List<NextEvolution> nextEvolution;

  Pokemon({
    required this.id,
    required this.number,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.egg,
    required this.spawnChance,
    required this.avgSpawns,
    required this.spawnTime,
    required this.multipliers,
    required this.weaknesses,
    required this.nextEvolution,
  });

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
    multipliers = json['multipliers']?.cast<double>();
    weaknesses = json['weaknesses'].cast<String>();
    if (json['next_evolution'] != null) {
      nextEvolution = [];
      json['next_evolution'].forEach((v) {
        nextEvolution.add(new NextEvolution.fromJson(v));
      });
    }
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
}
