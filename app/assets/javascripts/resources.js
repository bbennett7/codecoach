// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


function nextResource() {
  const id = parseInt(event.target.dataset.id);
  const userIndexUrl = `http://localhost:3000${userInfo}/resources.json`;

  let userIndexJson;

  fetch(userIndexUrl)
    .then( function(res) { return res.json() })
    .then( function(json) {
      userIndexJson = json;

      let resourceIndex = userIndexJson.findIndex(function(resource) {
        return resource.id === id;
      });

      let nextResourceIndex = resourceIndex + 1;
      return userIndexJson[nextResourceIndex]
    })
}
