var productContainer = document.querySelector('.row');
var productTemplate = document.querySelector('#product-card');

axios.get("localhost:3000/v2/products").then(function(response) {
  console.log(response.data);

  var products = response.data;
  for (var i = 0; i < products.length; i++) {
    var productClone = productTemplate.content.cloneNode(true);
    productClone.querySelector('.name').innerText = products[i].name;
    productClone.querySelector('.price').innerText = products[i].price;
    productClone.querySelector('.description').innerText = products[i].description;
  } 


// $(function() { 
// var myChart = Highcharts.chart('container', {
//     chart: {
//       type: 'bar'
//     },
//     title: {
//       text: 'Fruit Consumption'
//     },
//     xAxis: {
//       categories: ['Apples', 'Bananas', 'Oranges']
//     },
//     yAxis: {
//       title: {
//         text: 'Fruit eaten'
//       }
//     },
//     series: [{
//       name: 'Jane',
//       data: [1, 0, 4]
//     }, {
//       name: 'John',
//       data: [5, 7, 3]
//     }]
//   });
});