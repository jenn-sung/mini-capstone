/* global Vue, VueRouter, axios */

var LogoutPage = {
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/v2/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      products:[]

    };
  },
  created: function() {
    axios.get('/v2/products').then(function(response) {
      this.products = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/"); 
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};


var NewProductPage = {
  template: "#new-product-page",
  data: function() {
    return {
      name: "",
      price: "",
      description: "",
      errors: []
    };
  },
  created: function() {
    console.log('new product');
  },
  methods: {
    addProduct: function() {
      var params = {
        name: this.name,
        price: this.price,
        description: this.description,
      };
      axios
        .post("/v2/products", params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};


var ShowProductPage = {
  template: "#show-product-page",
  data: function() {
    return {
      product: {}

    };
  },
  created: function() {
    axios.get('/v2/products/' + this.$route.params.id).then(function(response) {
      this.product = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};


var EditProductPage = {
  template: "#edit-product-page",
  data: function() {
    return {
      product: {},
      errors: []
    };
  },
  methods: {
    editProduct: function() {
      var params = {
        name: this.product.name,
        price: this.product.price,
        description: this.product.description,
      };
      console.log(params);
      axios
        .patch("/v2/products/" + this.$route.params.id, params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  },
  created: function() {
    console.log('running created');
    axios.get('/v2/products/' + this.$route.params.id).then(function(response) {
      this.products = response.data;
    }.bind(this));
  }
};


var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage },
    { path: "/products/new", component: NewProductPage },
    { path: "/products/:id", component: ShowProductPage },
    { path: "/products/:id/edit", component: EditProductPage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});

