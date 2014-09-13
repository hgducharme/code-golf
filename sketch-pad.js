// Creates Table
var sketch = {
	addTable: function() {
		$(".grid").append('<table><tbody></tbody></table>');
	},

	addRows: function() {
		for (var i = 0; i < 16; i++) {
			$("tbody").append('<tr></tr>');
		}
	},

  	addCells: function() {
		for (var i = 0; i < 16; i++) {
			$("tr").append("<td></td>");
		}
	},
};

$(document).ready(function() {
    sketch.addTable();
    sketch.addRows();
    sketch.addCells();
   }
);
