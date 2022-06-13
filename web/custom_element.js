function createCustomElement(
  observedAttributes,
  onCreated,
  onConnected,
  onDisconnected,
  onAdopted,
  onAttributeChanged
) {
  class CustomElement extends HTMLElement {
    static observedAttributes = observedAttributes;

    constructor() {
      super();
      onCreated(this);
    }

    connectedCallback() {
      onConnected();
    }

    disconnectedCallback() {
      onDisconnected();
    }

    adoptedCallback() {
      onAdopted();
    }

    attributeChangedCallback(a, b, c, whatIsThis) {
      onAttributeChanged(a, b, c);
    }
  }

  return CustomElement;
}

function defineCustomElement(tag, customElement) {
  customElements.define(tag, customElement);
}
