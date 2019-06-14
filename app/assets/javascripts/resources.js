// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/



$(document).ready(function() {
  class Resource{
    constructor(website, title, url, languageId, subfieldId, mentorId, read, studentRating) {
      this.website = website;
      this.title = title;
      this.url = url;
      this.languageId = languageId;
      this.subfieldId = subfieldId;
      this.mentorId = mentorId;
      this.read = read;
      this.studentRating = studentRating;
    };

    websiteTitle(){ return `${this.website} - ${this.title}` };
  };

  $(function() {
    $('#new_resource').submit(function(event) {
      event.preventDefault();

      var values = $(this).serialize();
      var userId = values.charAt(values.length - 1)

      var posting = $.post('/mentors/' + userId + '/resources', values);

      posting.done(function(data) {
        var resource = data;
        var resourcePath = `http://localhost:3000/mentors/` + userId + `/resources/` + resource.id;

        let newResource = new Resource(data.website, data.title, data.url, data.language_id, data.subfield_id, data.mentor_id, data.read, data.student_rating)

        var newestResourceDiv = document.getElementById('newestResource')
        var noResourceMessage = document.getElementById('noResourceMessage')

        newestResourceDiv.innerHTML = `<p><a href="${resourcePath}">${newResource.websiteTitle()}</a></p>`;

        noResourceMessage.innerHTML = ""
      });
    });
  });
});
