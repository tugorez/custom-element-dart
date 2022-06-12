import 'dart:html';

class HelloWorldElement extends HtmlElement {
  HelloWorldElement.created() : super.created() {
    //
  }

  @override
  void connectedCallback() {
    print('Whaaaaaaaaaaaaaaaaat');
  }
}

void main() {
  window.customElements?.define('hello-world', HelloWorldElement);
}
