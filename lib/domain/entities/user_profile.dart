class UserProfile {
  const UserProfile({
    required this.uid,
    required this.name,
    required this.email,
    this.country = 'India',
    this.level = 'ARHATIC PRACTITIONER • Level 1',
    this.createdAt,
  });

  final String uid;
  final String name;
  final String email;
  final String country;
  final String level;
  final DateTime? createdAt;

  factory UserProfile.fromMap(String uid, Map<String, dynamic> map) {
    return UserProfile(
      uid: uid,
      name: map['name'] as String? ?? '',
      email: map['email'] as String? ?? '',
      country: map['country'] as String? ?? 'India',
      level: map['level'] as String? ?? 'ARHATIC PRACTITIONER • Level 1',
      createdAt: DateTime.tryParse(map['createdAt'] as String? ?? ''),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'country': country,
      'level': level,
      'createdAt': createdAt?.toIso8601String(),
    };
  }

  UserProfile copyWith({String? name}) {
    return UserProfile(
      uid: uid,
      name: name ?? this.name,
      email: email,
      country: country,
      level: level,
      createdAt: createdAt,
    );
  }
}
