function createCustomElement(observedAttributes, onCreated) {
  class CustomElement extends HTMLElement {
    static observedAttributes = observedAttributes;

    constructor() {
      super();
      const dartObject = onCreated(this);
      this.onConnected = dartObject[0];
      this.disconnected = dartObject[1];
      this.onAdopted = dartObject[2];
      this.onAttributeChanged = dartObject[3];
    }

    connectedCallback() {
      this.onConnected();
    }

    disconnectedCallback() {
      this.onDisconnected();
    }

    adoptedCallback() {
      this.onAdopted();
    }

    attributeChangedCallback(a, b, c, whatIsThis) {
      this.onAttributeChanged(a, b, c);
    }
  }

  return CustomElement;
}

function defineCustomElement(tag, customElement) {
  customElements.define(tag, customElement);
}
