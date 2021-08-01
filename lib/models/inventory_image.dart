import 'package:hive/hive.dart';

part 'inventory_image.g.dart';

@HiveType(typeId: 0)
class InventoryImage {
  @HiveField(0)
  final String link;
  InventoryImage({required this.link});
}
