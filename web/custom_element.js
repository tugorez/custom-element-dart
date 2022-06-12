function createCustomElement(
  observedAttributes,
  onCreated,
  onConnected,
  onDisconnected,
  onAdopted,
  onAttributeChanged
) {
  function CustomElement() {
    const element = Reflect.construct(HTMLElement, [], CustomElement);
    onCreated(element);
    return element;
  }

  CustomElement.observedAttributes = observedAttributes;
  CustomElement.prototype = Object.create(HTMLElement.prototype);
  CustomElement.prototype.connectedCallback = onConnected;
  CustomElement.prototype.disconnectedCallback = onDisconnected;
  CustomElement.prototype.adoptedCallback = onAdopted;
  CustomElement.prototype.attributeChangedCallback = (
    attributeName,
    oldValue,
    newValue,
    whatIsThisArgument //dunno why this thing is injecting 4 arguments.
  ) => onAttributeChanged(attributeName, oldValue, newValue);

  return CustomElement;
}

function defineCustomElement(tag, customElement) {
  customElements.define(tag, customElement);
}
