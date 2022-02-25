

import 'package:hive/hive.dart';

part 'addition.g.dart';


@HiveType(typeId: 1)
class Addition {
  Addition({
    required this.price,
    required this.id,
    required this.name,
    required this.old_price

  });

  @HiveField(0)
   int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final double? price;
  @HiveField(3)
  final double? old_price;





}