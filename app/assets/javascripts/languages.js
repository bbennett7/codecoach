// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function(){


  $('#home').click(function(event) {
    // alert("sup")
    event.preventDefault()
    let currentUrl = document.location.href
    currentUrl += ".json"

    var languagesDiv = document.getElementById("languages");

    // fetch(currentUrl)
    //   .then( response => console.log(response.json()))
    //   .then( json => languagesDiv.innerHTML = listOfLanguages(json.languages) )

    $.get(currentUrl, function (data) {
      console.log(data)
      languagesDiv.append(listOfLanguages(data.languages))
      debugger
    })

    function listOfLanguages(languages) {
      const languagesList = languages.map(language => `<li>${language.name}</li>`)
      return `<ul>${languagesList.join("")}</ul>`}
  });
});
