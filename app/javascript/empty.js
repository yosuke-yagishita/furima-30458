const empty = () => {
  document.getElementById("postal-code").removeAttribute("value");
  document.getElementById("prefecture").removeAttribute("value");
  document.getElementById("city").removeAttribute("value");
  document.getElementById("addresses").removeAttribute("value");
  document.getElementById("building").removeAttribute("value");
  document.getElementById("phone-number").removeAttribute("value");
};

window.addEventListener("load", empty)