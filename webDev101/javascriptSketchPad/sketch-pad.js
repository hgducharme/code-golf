$(function() {
  buildTable(16);
  hover();
  resetTable();
  trail();
  randomColorHover();
  resetTableTrail();
});



// CREATES TABLE
function buildTable(n) {

  var boxSize = (850/n);

  $('.grid').append('<table><tbody></table></tbody>');

  for(var i = 0; i < n; i++) {
    $('tbody').append('<tr></tr>')
  };

  for(var i = 0; i < n; i++) {
    $('tr').append('<td></td>');
    $('td').css('height', boxSize);
    $('td').css('width', boxSize);
  };
};



// CREATES HOVER FUNCTION TO ADD BLUE COLOR
function hover() {
  $('td').hover(function() {
    $(this).css('background-color', 'rgb(90,188,215)');
  },

  function() {
    $(this).css('background-color', 'rgb(90,188,215)');
  });
};



// REBUILDS TABLE WHEN BUTTON IS CLICKED
function resetTable() {
  $('button').on('click', function() {

    var choice = prompt("How many columns and rows would you like? Please pick a number between (1 & 64).", "16");
    
    if (choice < 1 || choice > 64) {
      alert("That was not a valid entry, please specify a number between (1 & 64)");
      return null;
    }

    else {
      var resetColor = $('td').css('background-color', 'rgb(215,215,215)');
      var removeTable = $('table').remove();
      buildTable(choice);
      hover();
    }
  });
}



// CREATES TRAIL MODE
function trail() {
  $("#trail").click(function() {
    
    $('td').css('background-color', 'rgb(90,188,215)')
    
    $('td').hover(function() {
      $(this).css('opacity', '0');
    },

    function() {
      $(this).fadeTo('slow', 1);
    });
  });
};



// CREATES RANDOM COLOR MODE
function randomColor() {
    var r = Math.floor(Math.random() * 256);
    var g = Math.floor(Math.random() * 256);
    var b = Math.floor(Math.random() * 256);

    return "rgb(" + r + "," +  g + ","+ b + ")"
};

function randomColorHover() {
  $('#randomColor').click(function() {
    $('td').hover(function() {
      $(this).css('background-color', randomColor() );
    }, function() {
      $(this).css('background-color', randomColor() );
    });
  });
}