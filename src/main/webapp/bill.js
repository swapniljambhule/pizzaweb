// get the form element
const form = document.querySelector('#orderform');

// add event listener for form submission
form.addEventListener('submit', (event) => {
  // prevent the default form submission
  event.preventDefault();

  // get the selected product and quantity
  const product = form.product.value;
  const quantity = form.quantity.value;

  // set the price based on the selected product
  let price = 0;
  switch (product) {
    case 'product1':
      price = 10;
      break;
    case 'product2':
      price = 20;
      break;
    case 'product3':
      price = 30;
      break;
    default:
      price = 0;
  }

  // calculate the total bill
  const total = price * quantity;

  // create a new element to display the total bill
  const totalElement = document.createElement('div');
  totalElement.id = 'total';
  totalElement.textContent = `Total: $${total}`;

  // remove any existing total element
  const existingTotalElement = document.querySelector('#total');
  if (existingTotalElement) {
    existingTotalElement.remove();
  }

  // add the new total element to the form
  form.appendChild(totalElement);
});

/**
 * 
 */