import 'package:dogventurehq/states/models/pet_list_model.dart';
import 'package:dogventurehq/states/models/rooms_model.dart';

class BoardingItem {
  RoomsModel? room;
  List<PetModel> pets;
  DateTime checkInDate;
  DateTime checkOutDate;

  BoardingItem({
    this.room,
    required this.pets,
    required this.checkInDate,
    required this.checkOutDate,
  });
}
