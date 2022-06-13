import 'package:js/js.dart';
import 'dart:html';

@JS('CustomElement')
abstract class _CustomElement {
  external void connectedCallback();
  external void disconnetedCallback();
  external void adoptedCallback();
  external void attributeChangedCallback(String, dynamic dynamic);
}

@JS('createCustomElement')
external _CustomElement _createCustomElement(
  List<String> observedAttributes,
  List<Function> Function(HtmlElement) onCreated,
);

@JS('defineCustomElement')
external void _defineCustomElement(String tag, _CustomElement element);

class CustomElement {
  final HtmlElement element;

  CustomElement(this.element);

  onConnected() {}
  onDisconnected() {}
  onAdopted() {}
  onAttributeChanged(String attrName, dynamic oldVal, dynamic newVal) {}
}

void defineCustomElement(
  String tag,
  List<String> observedAttributes,
  CustomElement Function(HtmlElement) creator,
) {
  // Somethin weird is going on. If you create a new element this breaks.
  final ce = _createCustomElement(
    observedAttributes,
    allowInterop((element) {
      final customElement = creator(element);
      return [
        allowInterop(customElement.onConnected),
        allowInterop(customElement.onDisconnected),
        allowInterop(customElement.onAdopted),
        allowInterop((a, b, c) => customElement.onAttributeChanged(a, b, c)),
      ];
    }),
  );
  _defineCustomElement(tag, ce);
}
