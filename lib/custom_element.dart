import 'package:js/js.dart';
import 'dart:html';

@JS('CustomElement')
abstract class _CustomElement {
  external void connectedCallback();
}

@JS('createCustomElement')
external _CustomElement _createCustomElement(
  OnCreated onCreated,
  OnConnected onConnected,
);

@JS('defineCustomElement')
external void _defineCustomElement(
  String tag,
  _CustomElement element,
);

typedef OnCreated = void Function(HtmlElement element);
typedef OnConnected = void Function();

class CustomElement {
  final HtmlElement element;

  CustomElement(this.element);

  onConnected() {}
}

typedef CustomElementCreator = CustomElement Function(HtmlElement);

void defineCustomElement(String tag, CustomElementCreator creator) {
  late final CustomElement customElement;
  final foo = _createCustomElement(
    allowInterop((element) {
      customElement = creator(element);
    }),
    allowInterop(() {
      customElement.onConnected();
    }),
  );
  _defineCustomElement(tag, foo);
}
