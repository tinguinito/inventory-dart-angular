part of 'index.dart';


@Injectable()
class ProductService {
  List<Product> mockProduct = PRODUCTS;

  Future<List<Product>> getProducts() async => mockProduct;
}

List<Product> PRODUCTS = <Product>[
  Product(sku: 'ski-1', product: 'Pantalón'),
  Product(sku: 'ski-2', product: 'Calcetines'),
  Product(sku: 'ski-3', product: 'Poleras'),
  Product(sku: 'ski-4', product: 'Camisas'),
  Product(sku: 'ski-5', product: 'Sombreros'),
];
