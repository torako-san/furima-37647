function tax (){
  const itemPrice = document.getElementById("item-price");
  if (!itemPrice){ return false};
  itemPrice.addEventListener("keyup", () => {
    const itemPriceValue = itemPrice.value
    const Tax = 0.1;
    const addTaxPrice = document.getElementById("add-tax-price");
    const tax_fee = itemPriceValue * Tax;
    addTaxPrice.innerHTML = Math.floor(tax_fee);
    const profit = document.getElementById("profit");
    const salesProfit = itemPriceValue - tax_fee;
    profit.innerHTML = Math.floor(salesProfit);
  });
}

window.addEventListener('load', tax);