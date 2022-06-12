function createCustomElement(tag, customElementConstructor) {
  let dartElement = null;

  function CustomElement() {
    let element = Reflect.construct(HTMLElement, [], CustomElement);
    dartElement = customElementConstructor(element);
    return element;
  }

  CustomElement.prototype = Object.create(HTMLElement.prototype);

  CustomElement.prototype.connectedCallback = function () {
    if (dartElement != null) {
      dartElement.onConnected();
    }
  };

  // Register the World element.
  customElements.define(tag, CustomElement);
}
