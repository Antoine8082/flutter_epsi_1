class Wizard {
  final String id;
  final String firstName;
  final String lastName;
  final List<String> elixirs;

  Wizard(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.elixirs});

  factory Wizard.fromJson(Map<String, dynamic> json) {
    return Wizard(
      id: json['id'],
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'],
      elixirs: (json['elixirs'] as List).map((e) => e.toString()).toList(),
    );
  }
}
