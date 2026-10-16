class UserSubModel {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String dateOfBirth;
  final String profileImageUrl;
  final String membershipType;
  final String preferredDepartment;

  final String ordersCount;
  final String wishlistCount;
  final String addressesCount;

  const UserSubModel({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.profileImageUrl,
    required this.membershipType,
    required this.preferredDepartment,
    required this.ordersCount,
    required this.wishlistCount,
    required this.addressesCount,
  });
}