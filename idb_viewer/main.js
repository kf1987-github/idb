
// viewer
var graph_width;
var graph_height;

// json objects
var topics;
var topics_default;

$(document).ready(async function() {

  let topics_json = await fetch("./topics.json");
  let topics_default_json = await fetch("./topics_default.json");

  let topics_text = await topics_json.text();
  let topics_default_text = await topics_default_json.text();

  //await console.log(topics_text)
  //await console.log(topics_default_text)
  topics = await JSON.parse(topics_text)
  topics_default = await JSON.parse(topics_default_text)
  //await console.log(topics)
  //await console.log(topics_default)

  let data = {}
  for (i = 0; i < await topics.nodes.length; i++) {
    let topic = topics.nodes[i];
    if (topic.topic == "Host"){
      //console.log("Fetching data...")

      data = await load_data_from_db("viewer", topic.viewer.query, topic.viewer.signature);
      //console.log("done Fetching data...")
      //await console.log(data)
      break;
    }
  }

  graph_width = Math.round($("#idb-start").width()*10/12);
  //console.log("gw: " + graph_width);
  graph_height = Math.round(graph_width*9/16);
  await load_viewer(data, graph_width, graph_height);

  await load_topics(topics, topics_default);
});

////

//var i_columns;
//var v_columns;
//var v_columns_default;
//var datatable_columns;

function get_topic(v_topics, topic, topic_type) {
  if (topic_type in v_topics){
    let t = v_topics[topic_type];
    for (i = 0; i < t.length; i++) {
      if (t[i].topic == topic){
        return t[i];
      }
    }
  }
  return {};
}

function load_topics(v_topics, v_topics_default) { 
  // load topics in dropdown menu
  for (i = 0; i < v_topics.reports.length; i++) {
    $("#menu_reports").append("<a class='dropdown-item' href='#' topic_type='reports'>" + v_topics.reports[i].topic + "</a>");
  };
  for (i = 0; i < v_topics.nodes.length; i++) {
    $("#menu_nodes").append("<a class='dropdown-item' href='#' topic_type='nodes'>" + v_topics.nodes[i].topic + "</a>");
  };
  for (i = 0; i < v_topics.relations.length; i++) {
    $("#menu_relations").append("<a class='dropdown-item' href='#' topic_type='relations'>" + v_topics.relations[i].topic + "</a>");
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
  $("#btn_group_topics .dropdown").on('click', '.dropdown-menu a', async function() {
    $("#container_main").show();
    $("#container_start").hide();
    $("#btn_group_downloads").show();
    $("#menu_nodes").siblings("button.dropdown-toggle").removeClass("btn-dark").addClass("btn-secondary").text("Nodes");
    $("#menu_relations").siblings("button.dropdown-toggle").removeClass("btn-dark").addClass("btn-secondary").text("Relations");
    $("#menu_reports").siblings("button.dropdown-toggle").removeClass("btn-dark").addClass("btn-secondary").text("Reports");
  
    let selText = $(this).text();
    $(this).parent("div.dropdown-menu").siblings("button.dropdown-toggle").removeClass("btn-secondary").addClass("btn-dark").text(selText);
  
    //var current_topic_index = $(this).attr("topic_index");

    let topic_type = $(this).attr("topic_type");
    let topic = $(this).text();
    let topic_json = get_topic(v_topics, topic, topic_type);
  
    let viewer_data = await load_data_from_db("viewer", topic_json.viewer.query, topic_json.viewer.signature);
    //await console.log(viewer_data)
    load_viewer(viewer_data, graph_width, graph_height);

    let browser_data = await load_data_from_db("browser", topic_json.browser.query, {});
    let column_data = browser_data.column_data;
    let topic_default_json = get_topic(v_topics_default, topic, topic_type);
    let column_keys_custom = browser_data.column_keys_custom;
    let datatable_columns_json = load_columns(topic_default_json, column_keys_custom);
    console.log(column_keys_custom); 
    console.log(column_data);
    await load_datatable(topic_json, column_data, datatable_columns_json);
  });
}

function toggleVisibility(index) {
  if ( ! $("#input_"+index).prop("checked") ) {
    $("#data_table").DataTable().column(index).visible( false );
    $("#input_all").prop("checked",false)
  } else {
    $("#data_table").DataTable().column(index).visible( true );
  }
}
function toggleVisibilityAll(columns_length, default_length) {
  if ( $("#input_all").prop("checked") ) {
    for (i = 0; i < columns_length; i++) {
      $("#input_"+i).prop("checked",true);
      $("#data_table").DataTable().column(i).visible( true, false );
    }
  } else {
    for (i = 0; i < columns_length; i++) {
      $("#input_"+i).prop("checked",false);
      $("#data_table").DataTable().column(i).visible( false, false );
    }
    for (i = 0; i < default_length; i++) {
      $("#data_table").DataTable().column(i).visible( true, false );
      $("#input_"+i).prop("checked",true);
    }
  }
}

function columnFormat(value) {
  return {"data": value, "title": value, "defaultContent": '', "visible": false};
}

function load_columns(topic_default_json, column_keys_custom) {
  let i_columns = column_keys_custom;
  let v_columns_default;
  if (topic_default_json != {} && "default_columns" in topic_default_json){
    v_columns_default = topic_default_json.default_columns;
  }
  else {
    v_columns_default = [];
  }
  
  let v_columns = v_columns_default.slice();
  let default_length = v_columns.length;
  for (i = 0; i < i_columns.length; i++) {
    if ( ! v_columns.includes(i_columns[i]) ) {
      v_columns.push(i_columns[i]);
    }
  }
  if (default_length == 0){
    default_length = v_columns.length;
  }
  datatable_columns = v_columns.map(columnFormat);
  console.log("datatable_columns:")
  console.log(datatable_columns)

  return {"columns": datatable_columns, "default_length": default_length};
}

function load_datatable (topic_json, column_data, datatable_columns_json) {

    let datatable_columns = datatable_columns_json.columns;
    let default_length = datatable_columns_json.default_length;

    // cleanup
    $("#checkboxes").empty();
    $("#menu_downloads").empty();
    if ( $.fn.DataTable.isDataTable('#data_table') ) {
      $('#data_table').DataTable().destroy();
      $('#data_table').empty();
    }

    // create checkboxes
    let html_text = "<label><input id='input_all' type='checkbox'";
    html_text = html_text + " onchange='toggleVisibilityAll(" + datatable_columns.length + ", " + default_length + ")'>" + "ALL" + "</label><br>";
    $("#checkboxes").append(html_text);

    for (i = 0; i < datatable_columns.length; i++) {
      html_text = "<label><input id='input_" + i + "' type='checkbox'";
      html_text = html_text + " onchange='toggleVisibility(" + i + ")'>" + datatable_columns[i].title + "</label><br>";
      $("#checkboxes").append(html_text);
    }

    // create download links
    $("#menu_downloads").append("<a class='dropdown-item' href='json/" + topic_json.topic + ".json'>json</a>");
    $("#menu_downloads").append("<a class='dropdown-item' href='csv/" + topic_json.topic + ".csv'>csv</a>");

    console.log("column_data:");
    console.log(column_data);

    let datatable_config = {
      destroy: true,
      data: column_data,
      columns: datatable_columns,
      lengthMenu: [ [10, 15, 25, 50, -1], [10, 15, 25, 50, "All"] ],
      pageLength: 15
    };
    //datatable_config.ajax.url = json_file;
    // load data table
    $('#data_table').DataTable(datatable_config);
    //$("#data_table").width("100%");

    for (i = 0; i < default_length; i++) {
      $("#data_table").DataTable().column(i).visible( true );
      $("#input_"+i).prop("checked",true);
    }
  };



