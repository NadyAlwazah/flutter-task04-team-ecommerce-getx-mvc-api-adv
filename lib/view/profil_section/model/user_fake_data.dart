 
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/model/user_sub_model.dart';

class UserFakeData {
 final user = const UserSubModel(
    fullName: 'Elena Rostova',
    email: 'elena.rostova@atelier.com',
    phoneNumber: '+1 212 555 0148',
    dateOfBirth: 'October 12, 1995',
    profileImageUrl:'https://tse1.mm.bing.net/th/id/OIP.-UmB7TiTP6qQC6th6LR92gHaLG?r=0&pid=Api&h=220&P=0',
    membershipType: 'VIP Patron Atelier',
    preferredDepartment: 'Menswear',

    ordersCount: '12',
    wishlistCount:'4',
    addressesCount: '2',
  );
}