function tax() {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input", ()=> {
    const rate = 0.1
    const countTax = Math.round(itemPrice.value * 100 * rate / 100).toLocaleString();
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${countTax}`;
    const countProfit = Math.round(itemPrice.value - (itemPrice.value * 100 * rate / 100)).toLocaleString();
    const profit = document.getElementById("profit");
    profit.innerHTML = `${countProfit}`;
  });
}

window.addEventListener("load", tax);