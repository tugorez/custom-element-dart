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
  Function(HtmlElement) onCreated,
  Function onConnected,
  Function onDisconnected,
  Function onAdopted,
  Function(String, dynamic, dynamic) onAttributeChanged,
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
  late final CustomElement customElement;
  final ce = _createCustomElement(
    observedAttributes,
    allowInterop((element) {
      customElement = creator(element);
    }),
    allowInterop(() => customElement.onConnected()),
    allowInterop(() => customElement.onDisconnected()),
    allowInterop(() => customElement.onAdopted()),
    allowInterop((a, o, n) => customElement.onAttributeChanged(a, o, n)),
  );
  _defineCustomElement(tag, ce);
}
