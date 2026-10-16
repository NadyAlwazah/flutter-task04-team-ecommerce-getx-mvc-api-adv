
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_model/address_model.dart';

final addressesData = [
  AddressModel(
    title: 'Home',
    name: 'Elena Rostova',
    address: '742 Evergreen Terrace, Apt 4B, New York, NY 10021',
    phone: '+1 (555) 234-5678',
    isPrimary: true,
    whiteGloveAvailable: true,
     icon: AssetsData.home,
  ),
  AddressModel(
    title: 'Office / Atelier Studio',
    name: 'Elena Rostova',
    address: '450 Lexington Ave, Floor 18, New York, NY 10017',
    phone: '+1 (555) 890-1234',
    isPrimary: false,
     icon: AssetsData.office,
  ),
];
