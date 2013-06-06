$(document).ready(function() {
  jQuery(function() {
    return $('#tags').tokenInput('/tags.json', {
      prePopulate: $('#tags').data('load')
    });
  });
});
