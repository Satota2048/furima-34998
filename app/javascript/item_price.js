window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
      const tax = 0.1;
      const inputTax = Math.floor(inputValue * tax);
    addTaxDom.innerHTML = inputTax;
    const profitDom = document.getElementById("profit");
      const profit = inputValue - inputTax;
    profitDom.innerHTML = profit;
})
});