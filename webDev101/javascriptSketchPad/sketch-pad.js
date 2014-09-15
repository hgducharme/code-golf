$(function() {
  buildTable(16);
  hover();
});



// Creates Table
function buildTable(n) {
  var b
  $('.grid').append('<table><tbody></table></tbody>');

  for(var i = 0; i < n; i++) {
    $('tbody').append('<tr></tr>')
  };

  for(var i = 0; i < n; i++) {
    $('tr').append('<td></td>')
  };
};



// Hover Function To Add Colors
function hover() {
  $('td').hover(function() {
    $(this).css('background-color', 'green');
  },

  function() {
    $(this).css('background-color', 'green');
  });
};

// Prompt Question & Re-build Table
/* function prompt() {
  $('.btn').click(function() {
    prompt("How many rows and columns would you like? Pick a number between (1 & 64)", "16");
  });
} */