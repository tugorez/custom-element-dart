import 'package:custom_element_dart/custom_element.dart';
import 'dart:html';

class HelloWorldElement extends CustomElement {
  static final observedAttributes = ['id'];

  HelloWorldElement(HtmlElement element) : super(element);

  @override
  onConnected() {
    element.innerText = 'Hello World!';
  }

  @override
  onDisconnected() {
    print('Element was disconnected');
  }

  @override
  onAdopted() {
    print('Element was adopted');
  }

  @override
  onAttributeChanged(String attrName, dynamic oldVal, dynamic newVal) {
    print('attrName: $attrName, oldVal: $oldVal, newVal: $newVal');
  }
}

void main() {
  defineCustomElement(
    'hello-world',
    HelloWorldElement.observedAttributes,
    HelloWorldElement.new,
  );
}
