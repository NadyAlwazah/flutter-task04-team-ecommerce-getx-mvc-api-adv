
class AddressModel {
  final String title;
  final String name;
  final String address;
  final String phone;
  final bool isPrimary;
  final bool whiteGloveAvailable;
 final String icon;
  AddressModel({
    required this.title,
    required this.name,
    required this.address,
    required this.phone,
    required this.isPrimary,
    this.whiteGloveAvailable = false, required this.icon,
  });

  AddressModel copyWith({
    String? title,
     String? address,
    String? name,
    String? icon,
    String? phone,
    bool? isPrimary,
    bool? whiteGloveAvailable,

  }) {
    return AddressModel(
      title: title ?? this.title,
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      isPrimary: isPrimary ?? this.isPrimary,
      whiteGloveAvailable:
          whiteGloveAvailable ?? this.whiteGloveAvailable, icon: icon??this.icon,
    );
  }
}
