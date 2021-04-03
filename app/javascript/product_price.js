window.addEventListener('load', () => {
  console.log("OK");

const priceInput = document.getElementById("product-price")
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);

  const addTaxDom = document.getElementById("add-tax-price")
  addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
  console.log(addTaxDom);

  const profitNumber = document.getElementById("profit")
  profitNumber.innerHTML = (Math.floor(inputValue - addTaxDom.innerHTML));
  console.log(profitNumber);
})
});
