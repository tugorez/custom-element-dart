import 'package:js/js.dart';
import 'dart:html';

@JS()
abstract class CustomElement {
  external void connectedCallback();
}

@JS()
external CustomElement createCustomElement(
  OnCreated onCreated,
  OnConnected onConnected,
);

@JS()
external void defineCustomElement(
  String tag,
  CustomElement element,
);

typedef OnCreated = void Function(HtmlElement element);
typedef OnConnected = void Function();
