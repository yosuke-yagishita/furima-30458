function tax() {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input", ()=> {
    const rate = 0.1
    const countVal = Math.round(itemPrice.value * 100 * rate / 100).toLocaleString();
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${countVal}`;
  });
}

setInterval(tax, 1000)