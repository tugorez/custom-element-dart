function createCustomElement(onCreated, onConnected) {
  function CustomElement() {
    const element = Reflect.construct(HTMLElement, [], CustomElement);
    onCreated(element);
    return element;
  }

  CustomElement.prototype = Object.create(HTMLElement.prototype);

  CustomElement.prototype.connectedCallback = onConnected;

  return CustomElement;
}

function defineCustomElement(tag, customElement) {
  customElements.define(tag, customElement);
}
