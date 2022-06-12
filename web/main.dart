import 'dart:html';
import 'package:js/js.dart';
import 'package:custom_element_dart/custom_element.dart';

class HelloWorldElement extends CustomElement {
  static final tag = 'hello-world';

  final HtmlElement element;

  HelloWorldElement(this.element);

  @override
  void onConnected() {
    element.innerText = 'Hello World!';
  }
}

void main() {
  createCustomElement(
      'hello-world', allowInterop((element) => HelloWorldElement(element)));
}
