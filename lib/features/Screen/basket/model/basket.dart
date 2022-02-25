
import 'package:hive/hive.dart';
import 'addition.dart';
part 'basket.g.dart';


@HiveType(typeId: 0)
class Basket {
  Basket({
    required this.amount,
    required this.price,
    required this.id,
    required this.size_id,
    required this.priceWithAddition,
    required this.name,
    required this.image,
    required this.additions,
    required this.sizeName,
    required this.sizePrice,
    required this.addition_id,
  });

  @HiveField(0)
   int? id;

  @HiveField(1)
   int? size_id;

  @HiveField(2)
   double? amount;

  @HiveField(3)
   double? price;

  @HiveField(4)
  double? priceWithAddition;

  @HiveField(5)
  String? image;

  @HiveField(6)
  String? name;

  @HiveField(7)
  String? sizeName;

  @HiveField(8)
  List<Addition> additions;

  @HiveField(9)
  double? sizePrice;

  @HiveField(10)
  List<int> addition_id;



}