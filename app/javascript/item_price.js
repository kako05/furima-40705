const priceInput = document.getElementById("item-price"); 
const addTaxDom = document.getElementById("add-tax-price");
const sellingPrice = document.getElementById("profit");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const tax = Math.floor(inputValue * 0.1);
  addTaxDom.innerHTML = tax;
  sellingPrice.innerHTML = Math.floor(inputValue - tax); 
});