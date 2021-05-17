import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'src/stock_component/stock_component.dart';


@Component(
  selector: 'my-app',
  styleUrls: [
    'app_component.css',
    'package:angular_components/app_layout/layout.scss.css'
  ],
  templateUrl: 'app_component.html',
  directives: [
    StockComponent,
    DeferredContentDirective,
    MaterialButtonComponent,
    MaterialIconComponent,
    MaterialPersistentDrawerDirective,
    MaterialToggleComponent,
    MaterialListComponent,
    MaterialListItemComponent,
  ],
)
class AppComponent {
  bool customWidth = false;
  bool end = false;
}
