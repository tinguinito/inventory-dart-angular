part of 'index.dart';

@Injectable()
class StocksService {
  List<Records> mockStocks = RECORDS;

  Future<List<Records>> getRecords() async => mockStocks;
}

var RECORDS = <Records>[
  Records(DateTime.now(), Product(sku: 'ski-1', product: 'Pantalón'), 20),
  Records(DateTime.now(), Product(sku: 'ski-2', product: 'Calcetines'), 500),
  Records(DateTime.now(), Product(sku: 'ski-3', product: 'Poleras'), 25),
  Records(DateTime.now(), Product(sku: 'ski-4', product: 'Camisas'), 32),
  Records(DateTime.now(), Product(sku: 'ski-5', product: 'Sombreros'), 10),
];
