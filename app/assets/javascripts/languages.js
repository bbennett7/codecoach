// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function(){


  $('#home').click(function(event) {
    alert("sup")
    let currentUrl = document.location.href

    var languagesDiv = document.getElementById("languages");

    fetch(currentUrl)
      .then( response => response.json())
      .then( response => languagesDiv.innerHTML = listOfLanguages(response.languages) )

    function listOfLanguages(languages) {
      const languagesList = languages.map(language => `<li>${language.name}</li>`)
      return `<ul>${languagesList.join("")}</ul>`}
  });
});
