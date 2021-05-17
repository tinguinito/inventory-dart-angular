part of 'index.dart';

@Injectable()
class InventoryService {
  List<Inventory> mockInventory = INV;

  Future<List<Inventory>> getInventary() async => mockInventory;
}

List<Inventory> INV = <Inventory>[
  Inventory(inventoryDate: DateTime(2021, 4, 30), sku: 'ski-1', value: 41),
  Inventory(inventoryDate: DateTime(2021, 4, 30), sku: 'ski-2', value: 80),
  Inventory(inventoryDate: DateTime(2021, 4, 30), sku: 'ski-3', value: 15),
  Inventory(inventoryDate: DateTime(2021, 4, 30), sku: 'ski-4', value: 20),
  Inventory(inventoryDate: DateTime(2021, 4, 30), sku: 'ski-5', value: 55)
];
