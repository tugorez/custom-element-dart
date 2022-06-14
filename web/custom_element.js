function defineCustomElement(
  tag,
  observedAttributes,
  getDartCustomElementHooks
) {
  class CustomElement extends HTMLElement {
    static observedAttributes = observedAttributes;

    constructor() {
      super();
      const dartCustomElementHooks = getDartCustomElementHooks(this);
      this.onConnected = dartCustomElementHooks[0];
      this.onDisconnected = dartCustomElementHooks[1];
      this.onAdopted = dartCustomElementHooks[2];
      this.onAttributeChanged = dartCustomElementHooks[3];
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

    attributeChangedCallback(attrName, oldVal, newVal, whatIsThis) {
      this.onAttributeChanged(attrName, oldVal, newVal);
    }
  }

  customElements.define(tag, CustomElement);
}
