$(document).ready(function() {
  jQuery(function() {
    return $('#tags').tokenInput('/tags.json', {
      prePopulate: tagData || null
    });
  });
});
