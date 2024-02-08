class Venue {
  final int id;
  final String name;
  final String address;
  final String city;
  final int capacity;
  final String surface;
  final String image;

  Venue({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.capacity,
    required this.surface,
    required this.image,
  });

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      id: json['venue']['id'],
      name: json['venue']['name'],
      address: json['venue']['address'],
      city: json['venue']['city'],
      capacity: json['venue']['capacity'],
      surface: json['venue']['surface'],
      image: json['venue']['image'],
    );
  }
}