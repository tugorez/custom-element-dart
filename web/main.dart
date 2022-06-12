import 'package:custom_element_dart/custom_element.dart';
import 'package:js/js.dart';
import 'dart:html';

class HelloWorldElement {
  final HtmlElement element;

  HelloWorldElement(this.element);

  onConnected() {
    element.innerText = 'Hello World!';
  }
}

void main() {
  late final HelloWorldElement element;
  final customElement = createCustomElement(
    allowInterop((e) {
      element = HelloWorldElement(e);
    }),
    allowInterop(() {
      element.onConnected();
    }),
  );

  defineCustomElement('hello-world', customElement);
}
