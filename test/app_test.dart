@TestOn('browser')
import 'package:angular_test/angular_test.dart';
import 'package:test/test.dart';
import 'package:inventory_dart_angular/app_component.dart';
import 'package:inventory_dart_angular/app_component.template.dart' as ng;

void main() {
  final testBed =
      NgTestBed.forComponent<AppComponent>(ng.AppComponentNgFactory);
  NgTestFixture<AppComponent> fixture;


  setUp(() async {
    fixture = await testBed.create();
  });

  tearDown(disposeAnyRunningTest);

  test('heading', () {
    // expect(fixture, contains('My First AngularDart App'));
  });

  // Testing info: https://angulardart.dev/guide/testing
}
