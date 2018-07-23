/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Grammar Slayer!"
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};

var UserIndexPage = {
  template: "#user-index-page",
  data: function() {
    return {
      users: []
    };
  },
  created: function() {
    axios
    .get("/api/users")
    .then(function(response) {
      this.users = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var GamePlayIndexPage = {
  template: "#gameplay-index-page",
  data: function() {
    return {
      gameplays: []
    };
  },
  created: function() {
    axios
    .get("/api/game_plays")
    .then(function(response) {
      this.gameplays = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var UserNewPage = {
  template: "#user-new-page",
  data: function() {
    return {
      username: "",
      name: "",
      city: "",
      state: "",
      mini_bio: "",
      age: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        username: this.username,
        name: this.name,
        city: this.city,
        state: this.state,
        mini_bio: this.mini_bio,
        age: this.age
      };
      axios
        .post("/api/users/new", params)
        .then(function(response) {
          router.push("/#/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var UserShowPage = {
  template: "#user-show-page",
  data: function() {
    return { 
      user: {
        username: "",
        name: "",
        city: "",
        state: "",
        mini_bio: "",
        age: ""
      }
    };
  },
  created: function() {
    axios
    .get("/api/users/" + this.$route.params.id )
    .then(function(response) {
      this.user = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};


var router = new VueRouter({
  routes: [
          { path: "/", component: HomePage },
          { path: "/signup", component: UserNewPage },
          { path: "/users", component: UserIndexPage },
          { path: "/users/:id", component: UserShowPage },
          { path: "/game_plays", component: GamePlayIndexPage }
          ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router
});

