var cardContainer = document.querySelector('.row');
var cardTemplate = document.querySelector('#record-card');

axios.get("http://localhost:3000/v2/products").then(function(response) {
  console.log(response.data);
});
