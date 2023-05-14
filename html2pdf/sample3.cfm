<cfhtmltopdf>
<style>
.container {
  display: flex;
}

.item {
  flex-grow: 1;
  height: 100px;
  background-color: gray;
  border: solid 1px red;
}

.item + .item {
  margin-left: 2%;
}
</style>
<div class="container">
  <div class="item">1</div>
  <div class="item">2</div>
  <div class="item">3</div>
</div>
</cfhtmltopdf>