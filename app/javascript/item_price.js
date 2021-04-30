function fee_profit () {
  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener("input", () =>{
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    addTaxDom.innerHTML = Math.floor(inputValue / 10);
    profit.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML);

  });
}

window.addEventListener('load', fee_profit);