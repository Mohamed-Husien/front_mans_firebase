class UserEntity {
  final String uid;
  final String email;
  final String? name;
  final String? phoneNumber;
  final String? address;

  UserEntity({
    this.name,
    this.phoneNumber,
    this.address,
    required this.uid,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
      'address': address,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      name: map['name'],
      phoneNumber: map['phoneNumber'],
      address: map['address'],
      uid: map['uid'],
      email: map['email'],
    );
  }

  UserEntity? copyWith({
    String? uid,
    String? email,
    String? name,
    String? phoneNumber,
    String? address,
  }) {
    return UserEntity(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
    );
  }

  @override
  String toString() {
    return 'UserEntity(uid: $uid, email: $email, name: $name, phoneNumber: $phoneNumber, address: $address)';
  }
}
