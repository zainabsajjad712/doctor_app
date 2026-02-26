class DoctorModel {
  final String id;
  final String name;
  final String hospital;
  final String specialty;
  final String imageUrl;
  final bool isOnline;

  DoctorModel({
    required this.id,
    required this.name,
    required this.hospital,
    required this.specialty,
    required this.imageUrl,
    required this.isOnline,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: (json['id'] ?? '').toString(),
      name: json['name'] ?? '',
      hospital: json['hospital'] ?? '',
      specialty: json['specialty'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      isOnline: json['isOnline'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "hospital": hospital,
    "specialty": specialty,
    "imageUrl": imageUrl,
    "isOnline": isOnline,
  };
}
