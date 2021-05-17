import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:inventory_dart_angular/src/bussines/model/index.dart';
import 'package:inventory_dart_angular/src/bussines/services/index.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
  selector: 'stock-component',
  styleUrls: ['stock_component.css'],
  templateUrl: 'stock_component.html',
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
    MaterialDialogComponent,
    ModalComponent,
    AutoFocusDirective,
    MaterialButtonComponent,
    materialInputDirectives,
    materialNumberInputDirectives,
    formDirectives,
    coreDirectives
  ],
  providers: [
    ClassProvider(StocksService),
    ClassProvider(InventoryService),
    ClassProvider(ProductService),
    overlayBindings
  ],
)
class StockComponent implements OnInit {
  final StocksService stocksService;
  final InventoryService inventoryService;
  final ProductService productService;

  List<MovementType> movementList = [
    MovementType(type: 'Ingreso', index: "1"),
    MovementType(type: 'Egreso', index: "2")
  ];

  MovementType movementType = MovementType();
  Product product = Product();
  num quantityForm = 0;

  List<Records> stocks = [];
  List<Inventory> inventory = [];
  List<Ingress> ingressList = [];
  List<Egress> egressList = [];
  List<Product> productList = [];
  String newTodo = '';
  bool showBasicScrollingDialog = false;

  StockComponent(
      this.inventoryService, this.productService, this.stocksService);

  @override
  Future<Null> ngOnInit() async {
    stocks = await stocksService.getRecords();
    inventory = await inventoryService.getInventary();
    productList = await productService.getProducts();
  }

  num ingressProduct(String sku) {
    num sum = 0;
    ingressList?.where((element) => element.sku == sku)?.forEach((element) {
      sum += element.quantity;
    });
    return sum;
  }

  num egressProduct(String sku) {
    num sum = 0;
    egressList?.where((element) => element.sku == sku)?.forEach((element) {
      sum += element.quantity;
    });
    return sum;
  }

  num getInventory(String sku) => inventory
      ?.firstWhere((element) => element.sku == sku,
          orElse: () => Inventory(value: 0))
      ?.value;

  Map<String, bool> setCssValidityClass(NgControl control) {
    final validityClass = control.valid == true ? 'is-valid' : 'is-invalid';
    return {validityClass: true};
  }

  @ViewChild('movementForm')
  NgForm movementForm;

  void onSubmit() {
    print(movementForm.form.valid);

    if (movementForm.form.valid) {
      if (movementType.index == '1') {
        ingressList.add(Ingress(
            ingressDate: DateTime.now(),
            sku: product.sku,
            quantity: quantityForm));

        stocks
            .firstWhere((element) => element.product.sku == product.sku)
            .stock += quantityForm;
      } else {
        egressList.add(Egress(
            egressDate: DateTime.now(),
            sku: product.sku,
            quantity: quantityForm));

        stocks
            .firstWhere((element) => element.product.sku == product.sku)
            .stock -= quantityForm;
      }
    }

    closeModal();
  }

  void closeModal() {
    showBasicScrollingDialog = false;
    quantityForm = 0;
    product.sku = '-1';
    movementType.index = '-1';
  }
}


