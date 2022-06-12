import 'dart:html';
import 'package:js/js.dart';

class CustomElement {
  void onConnected() {}
}

typedef CustomeElementConstructor = CustomElement Function(HtmlElement);

@JS()
external void createCustomElement(
  String tag,
  CustomeElementConstructor constructor,
);
