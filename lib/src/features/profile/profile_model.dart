class DoctorProfileModel {
  final String hospitalName;
  final String doctorName;
  final String specialty;
  final String doctorImage;
  final bool isOnline;

  final int experience;
  final double rating;

  final String price;
  final String priceUnit;

  final ReviewModel review;

  const DoctorProfileModel({
    required this.hospitalName,
    required this.doctorName,
    required this.specialty,
    required this.doctorImage,
    required this.isOnline,
    required this.experience,
    required this.rating,
    required this.price,
    required this.priceUnit,
    required this.review,
  });
}

class ReviewModel {
  final String userName;
  final String timeAgo;
  final double rating;
  final String userImage;
  final String comment;

  const ReviewModel({
    required this.userName,
    required this.timeAgo,
    required this.rating,
    required this.userImage,
    required this.comment,
  });
}
