
var i_columns;
var v_columns;
var v_columns_default;
var datatable_columns;

// load topics in dropdown menu
for (i = 0; i < topics.length; i++) {
  if (topics[i].topic_type == "reports") {
    $("#menu_reports").append("<a class='dropdown-item' href='#' topic_index='" + i + "'>" + topics[i].topic + "</a>");
  }
  else if (topics[i].topic_type == "nodes") {
    $("#menu_nodes").append("<a class='dropdown-item' href='#' topic_index='" + i + "'>" + topics[i].topic + "</a>");
  }
  else if (topics[i].topic_type == "relations") {
    $("#menu_relations").append("<a class='dropdown-item' href='#' topic_index='" + i + "'>" + topics[i].topic + "</a>");
  }
};

// show start page
// hide main page
// disbale download button
// default text from dropdown menu in dropdown button
$("#title").on('click', function() {
  $("#container_main").hide();
  $("#btn_group_downloads").hide();
  $("#container_start").show();
  $("#menu_nodes").siblings("button.dropdown-toggle").removeClass("btn-dark").addClass("btn-secondary").text("Nodes");
  $("#menu_relations").siblings("button.dropdown-toggle").removeClass("btn-dark").addClass("btn-secondary").text("Relations");
  $("#menu_reports").siblings("button.dropdown-toggle").removeClass("btn-dark").addClass("btn-secondary").text("Reports");
});

// show main page
// show clicked text from dropdown menu in dropdown button
// hide start page
// enable download button
$("#btn_group_topics .dropdown").on('click', '.dropdown-menu a', function() {
  $("#container_main").show();
  $("#container_start").hide();
  $("#btn_group_downloads").show();
  $("#menu_nodes").siblings("button.dropdown-toggle").removeClass("btn-dark").addClass("btn-secondary").text("Nodes");
  $("#menu_relations").siblings("button.dropdown-toggle").removeClass("btn-dark").addClass("btn-secondary").text("Relations");
  $("#menu_reports").siblings("button.dropdown-toggle").removeClass("btn-dark").addClass("btn-secondary").text("Reports");

  var selText = $(this).text();
  $(this).parent("div.dropdown-menu").siblings("button.dropdown-toggle").removeClass("btn-secondary").addClass("btn-dark").text(selText);

  var current_topic_index = $(this).attr("topic_index");
  load_columns(current_topic_index);
  load_datatable(current_topic_index);
});

function toggleVisibility(index) {
  if ( ! $("#input_"+index).prop("checked") ) {
    $("#data_table").DataTable().column(index).visible( false );
    $("#input_all").prop("checked",false)
  } else {
    $("#data_table").DataTable().column(index).visible( true );
  }
}
function toggleVisibilityAll() {
  if ( $("#input_all").prop("checked") ) {
    for (i = 0; i < v_columns.length; i++) {
      $("#input_"+i).prop("checked",true);
      $("#data_table").DataTable().column(i).visible( true, false );
    }
  } else {
    for (i = 0; i < v_columns.length; i++) {
      $("#input_"+i).prop("checked",false);
      $("#data_table").DataTable().column(i).visible( false, false );
    }
    for (i = 0; i < v_columns_default.length; i++) {
      $("#data_table").DataTable().column(i).visible( true, false );
      $("#input_"+i).prop("checked",true);
    }
  }
}

function columnFormat(value) {
  return "{ data: '" + value + "', title: '" + value + "', 'defaultContent': '', 'visible': false }";
}

function load_columns(index) {
  // topics is defined in external js topics.js
  i_columns = topics[index].columns;
  v_columns_default = topics[index].default_columns;
  
  v_columns = v_columns_default.slice();
  for (i = 0; i < i_columns.length; i++) {
    if ( ! v_columns.includes(i_columns[i]) ) {
      v_columns.push(i_columns[i]);
    }
  }
  datatable_columns = eval("[" + v_columns.map(columnFormat) + "]");
}

function load_datatable (index) {

    // cleanup
    $("#checkboxes").empty();
    $("#menu_downloads").empty();
    if ( $.fn.DataTable.isDataTable('#data_table') ) {
      $('#data_table').DataTable().destroy();
      $('#data_table').empty();
    }

    // create checkboxes
    var html_text = "<label><input id='input_all' type='checkbox'";
    html_text = html_text + " onchange='toggleVisibilityAll()'>" + "ALL" + "</label><br>";
    $("#checkboxes").append(html_text);

    for (i = 0; i < v_columns.length; i++) {
      html_text = "<label><input id='input_" + i + "' type='checkbox'";
      html_text = html_text + " onchange='toggleVisibility(" + i + ")'>" + v_columns[i] + "</label><br>";
      $("#checkboxes").append(html_text);
    }

    // create download links
    $("#menu_downloads").append("<a class='dropdown-item' href='json/" + topics[index].topic + ".json'>json</a>");
    $("#menu_downloads").append("<a class='dropdown-item' href='csv/" + topics[index].topic + ".csv'>csv</a>");

    // create datatables config
    var json_file = "json/" + topics[index].topic + ".json";

    var datatable_config = {
      ajax: {
        dataSrc: ''
      },
      columns: datatable_columns,
      lengthMenu: [ [10, 15, 25, 50, -1], [10, 15, 25, 50, "All"] ],
      pageLength: 15
    };
    datatable_config.ajax.url = json_file;
    // load data table
    $('#data_table').DataTable(datatable_config);
    //$("#data_table").width("100%");

    for (i = 0; i < v_columns_default.length; i++) {
      $("#data_table").DataTable().column(i).visible( true );
      $("#input_"+i).prop("checked",true);
    }
  };


