function profit() {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", ()=> {
    const rate = 0.1
    const countVal = Math.round(itemPrice.value - (itemPrice.value * 100 * rate / 100)).toLocaleString();
    const profit = document.getElementById("profit");
    profit.innerHTML = `${countVal}`;
  });
}

window.addEventListener("load", profit);