class DoctorModel {
  // Basic (List Screen)
  final String id;
  final String name;
  final String hospital;
  final String specialty;
  final String imageUrl;
  final bool isOnline;

  // Details Screen (Stats + About)
  final bool isVerified; // "Certified"
  final int experienceYears; // "5 Years"
  final double rating; // "4.5"
  final String about; // About text

  // Contact / Actions
  final String? phone; // for call
  final String? email; // for mail
  final bool canCall; // optional feature flag
  final bool canChat; // optional feature flag

  // Optional: if you use chat rooms directly
  final String? chatId; // if your backend gives a chatRoomId

  const DoctorModel({
    required this.id,
    required this.name,
    required this.hospital,
    required this.specialty,
    required this.imageUrl,
    required this.isOnline,
    required this.isVerified,
    required this.experienceYears,
    required this.rating,
    required this.about,
    this.phone,
    this.email,
    this.chatId,
    this.canCall = true,
    this.canChat = true,
  });

  /// Safe helper getters (UI me use karne ke liye)
  bool get hasPhone => (phone ?? '').trim().isNotEmpty;
  bool get hasEmail => (email ?? '').trim().isNotEmpty;

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: (json['id'] ?? '').toString(),
      name: (json['name'] ?? '').toString(),
      hospital: (json['hospital'] ?? '').toString(),
      specialty: (json['specialty'] ?? '').toString(),
      imageUrl: (json['imageUrl'] ?? '').toString(),
      isOnline: json['isOnline'] ?? false,

      isVerified: json['isVerified'] ?? false,
      experienceYears: _toInt(json['experienceYears']),
      rating: _toDouble(json['rating']),
      about: (json['about'] ?? '').toString(),

      phone: (json['phone'] ?? '').toString().trim().isEmpty
          ? null
          : (json['phone']).toString(),
      email: (json['email'] ?? '').toString().trim().isEmpty
          ? null
          : (json['email']).toString(),
      chatId: (json['chatId'] ?? '').toString().trim().isEmpty
          ? null
          : (json['chatId']).toString(),

      canCall: json['canCall'] ?? true,
      canChat: json['canChat'] ?? true,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "hospital": hospital,
    "specialty": specialty,
    "imageUrl": imageUrl,
    "isOnline": isOnline,
    "isVerified": isVerified,
    "experienceYears": experienceYears,
    "rating": rating,
    "about": about,
    "phone": phone,
    "email": email,
    "chatId": chatId,
    "canCall": canCall,
    "canChat": canChat,
  };

  DoctorModel copyWith({
    String? id,
    String? name,
    String? hospital,
    String? specialty,
    String? imageUrl,
    bool? isOnline,
    bool? isVerified,
    int? experienceYears,
    double? rating,
    String? about,
    String? phone,
    String? email,
    String? chatId,
    bool? canCall,
    bool? canChat,
  }) {
    return DoctorModel(
      id: id ?? this.id,
      name: name ?? this.name,
      hospital: hospital ?? this.hospital,
      specialty: specialty ?? this.specialty,
      imageUrl: imageUrl ?? this.imageUrl,
      isOnline: isOnline ?? this.isOnline,
      isVerified: isVerified ?? this.isVerified,
      experienceYears: experienceYears ?? this.experienceYears,
      rating: rating ?? this.rating,
      about: about ?? this.about,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      chatId: chatId ?? this.chatId,
      canCall: canCall ?? this.canCall,
      canChat: canChat ?? this.canChat,
    );
  }

  // ---- parsers ----
  static int _toInt(dynamic v) {
    if (v == null) return 0;
    if (v is int) return v;
    return int.tryParse(v.toString()) ?? 0;
  }

  static double _toDouble(dynamic v) {
    if (v == null) return 0.0;
    if (v is double) return v;
    if (v is int) return v.toDouble();
    return double.tryParse(v.toString()) ?? 0.0;
  }
}
