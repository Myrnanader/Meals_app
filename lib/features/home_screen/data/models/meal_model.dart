class Meal {
  final String name;
  final String description;
  final String imageUrl;
  final double rate;
  final String time;

  Meal({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.rate,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'description': description,
      'time': time,
      'rate': rate,
    };
  }

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      name: map['name'],
      imageUrl: map['imageUrl'],
      description: map['description'],
      time: map['time'],
      rate:map['rate'],
    );
  }
}
