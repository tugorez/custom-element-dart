import 'package:custom_element_dart/custom_element.dart';
import 'dart:html';

class HelloWorldElement extends CustomElement {
  HelloWorldElement(HtmlElement element) : super(element);

  @override
  onConnected() {
    element.innerText = 'Hello World!';
  }
}

void main() {
  defineCustomElement('hello-world', (e) => HelloWorldElement(e));
}
