class AppointmentModel {
  final String date;
  final String time;
  final String location;
  final String doctorName;
  final String doctorSpecialist;
  final String doctorImage;

  AppointmentModel({
    required this.date,
    required this.time,
    required this.location,
    required this.doctorName,
    required this.doctorSpecialist,
    required this.doctorImage,
  });

  /// ✅ copyWith MUST be inside class
  AppointmentModel copyWith({
    String? date,
    String? time,
    String? location,
    String? doctorName,
    String? doctorSpecialist,
    String? doctorImage,
  }) {
    return AppointmentModel(
      date: date ?? this.date,
      time: time ?? this.time,
      location: location ?? this.location,
      doctorName: doctorName ?? this.doctorName,
      doctorSpecialist:
          doctorSpecialist ?? this.doctorSpecialist,
      doctorImage: doctorImage ?? this.doctorImage,
    );
  }
}