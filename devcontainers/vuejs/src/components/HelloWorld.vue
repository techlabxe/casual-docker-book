<template>
  <div class="hello">
    <button v-on:click="onAddButtonClicked">Add</button>
    <button v-on:click="onDecButtonClicked">Dec</button>
    <h1>count = {{ count }}</h1>
  </div>
</template>

<script lang="ts">
import Vue from 'vue';

export default Vue.extend({
  name: 'HelloWorld',
  data() {
    return {
      count: 0
    };
  },
  methods: {
    onAddButtonClicked() {
      this.count++;
    },
    onDecButtonClicked() {
      this.count--;
    }
  }
});
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
