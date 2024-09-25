import 'package:gastro_experience/models/restaurants.dart';
import 'package:gastro_experience/repository/address_repository.dart';

final List<Restaurants> resurantsRepository = [
  Restaurants(
      idRestaurant: 1,
      name: 'Vei do caldo',
      priceRange: 1,
      address: addressRepository[1],
      mainImage:
          'https://mir-s3-cdn-cf.behance.net/project_modules/fs/ec4d9c98203055.5ed6dbcb95425.png',
      description:
          'Vei anda nas madrugadas de juazeiro vendendo o melhor caldo da região.',
      openingHours: '',
      phoneNumber: '88 9 8745 3652',
      whatsapp: '88 9 8745 3652'),
  Restaurants(
      idRestaurant: 1,
      name: 'Ligerinho',
      priceRange: 1,
      address: addressRepository[0],
      mainImage:
          'https://mir-s3-cdn-cf.behance.net/project_modules/fs/ec4d9c98203055.5ed6dbcb95425.png',
      description:
          'O sanduiche mais higienico da cidade',
      openingHours: '',
      phoneNumber: '88 9 8745 3652',
      whatsapp: '88 9 8745 3652'),
];
