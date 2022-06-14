import 'package:js/js.dart';
import 'dart:html';

@JS('defineCustomElement')
external void _defineCustomElement(
  String tag,
  List<String> observedAttributes,
  List<Function> Function(HtmlElement) getDartCustomElementHooks,
);

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
  _defineCustomElement(
    tag,
    observedAttributes,
    allowInterop((element) {
      final customElement = creator(element);
      return [
        allowInterop(customElement.onConnected),
        allowInterop(customElement.onDisconnected),
        allowInterop(customElement.onAdopted),
        allowInterop(customElement.onAttributeChanged),
      ];
    }),
  );
}
