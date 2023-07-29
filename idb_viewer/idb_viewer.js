
var graphData = {nodes:[], links:[]};
var graph = "";

async function load_data_from_db(target, query, signature) {

  // target is "browser" of "viewer"
  // query is a cypher query
  // signature lists the return aliasses from the query,
  //   for example: {node_aliasses: ["n"], relation_aliasses: ["r"]}
  // for target "browser" the signature is {}
  //   and the query should return only column data and not entire nodes or relations

  const URI = 'neo4j://localhost'
  const USER = 'neo4j'
  const PASSWORD = 'docker4j'
  let driver, result

  // Connect to database
  try {
    driver = neo4j.driver(URI,  neo4j.auth.basic(USER, PASSWORD))
    await driver.verifyConnectivity()
  } catch(err) {
    return
    console.log('Connection error\n${err}\nCause: ${err.cause}')
  }

  // Retrieve query results
  result = await driver.executeQuery(query, {},
    { database: 'neo4j' }
  )
  console.log("result:")
  console.log(result)

  let nodes = [];
  let links = [];
  let column_data = [];
  let keys;

  if (target == "browser") {
    console.log("no signature")
    console.log(result)
    for(let rec of await result.records) {
      console.log(rec);
      let data_record = {};
      keys = rec.keys.map(function(key) {if(key.split(".").length > 1) {return key.split(".")[1]}; return key;});
      let values = rec._fields;
      for (i = 0; i < keys.length; i++) {
        let key = keys[i];
        data_record[key] = values[i];
      }
      column_data.push(data_record);
    }
  }
  else if (target == "viewer") {
    // collect results based on signature
    for(let rec of await result.records) {
      // loop through signature.node_aliasses
      signature.node_aliasses.forEach(function (alias) {
        // get node object <n> from current record <rec> by alias
        let n = rec.get(alias)
        // rename property <elementId> to <id>
        if (nodes.findIndex( (x) => {return x.elementId == n.elementId} ) == -1){
          let node = JSON.parse(JSON.stringify(n))
          nodes.push(node)
          console.log(node)
        }
        else {
          console.log("duplicate node filtered out: " + n.elementId)
        }
      })
      // loop through signature.relation_aliasses
      signature.relation_aliasses.forEach(function (alias) {
        // get relation object <r> from current record <rec> by alias
        let r = rec.get(alias)
        // rename property <elementId> to <id>
        if (links.findIndex( (x) => {return x.elementId == r.elementId} ) == -1){
          let link = JSON.parse(JSON.stringify(r))
          links.push(link)
          console.log(link)
        }
        else {
          console.log("duplicate relation filtered out: " + r.elementId)
        }
      })
    }
  }

  await driver.close()
  return {nodes: nodes, links: links, column_data: column_data, column_keys_custom: keys}
}

function load_viewer(data, graph_width, graph_height) {
  let nodes = data.nodes
  let links = data.links

  console.log(nodes)
  console.log(links)

  graphData.nodes.splice(0,graphData.nodes.length)
  graphData.links.splice(0,graphData.links.length)

  for (let node of nodes){
    let n = JSON.parse(JSON.stringify(node).replaceAll("elementId","id"))
    //n.id = "id_" + n.id
    graphData.nodes.push(n)
  }
  for (let link of links){
    let r = JSON.parse(JSON.stringify(link).replaceAll("elementId","id").replaceAll("startNodeElementId","source").replaceAll("endNodeElementId","target"))
    //r.id = "id_" + r.id
    graphData.links.push(r)
  }

  console.log(graphData)

      let elem = document.getElementById("graph")
  //console.log(graph_width)
  //console.log(graph)
      graph = ForceGraph()(elem)
        .backgroundColor('#101020')
        .height(graph_height)
        .width(graph_width)
        .nodeRelSize(6)
        .nodeAutoColorBy(node => node.labels[0])
        .nodeLabel(node => get_html_legend(node, "node"))
        .linkLabel(link => get_html_legend(link, "link"))
        .linkColor(() => 'rgba(255,255,255,0.2)')
        .linkDirectionalParticles(3)
        .onNodeClick(function (node, event){$("#node_legend").append(get_html_legend(node, "node"))} )
        .graphData(graphData);
}

function get_html_legend(object, object_type) {
  let v_title;
  let v_color;
  let v_removeX;
  if (object_type == "node"){
    v_title = object.labels[0];
    v_color = object.color;
    v_removeX = "<b style='float: right; cursor: pointer;' onclick='$(this).parent().remove()'>X</b>";
  }
  else if (object_type = "link"){
    v_title = object.type;
    v_color = "rgba(255,255,255,0.2)";
    v_removeX = "";
  }
  let html_text = "<div style='color: #000000; background-color:" + v_color + "'>" +
                  "<b>" + v_title + "</b>" +
                  v_removeX + "<br>";
  let props = object.properties;
  for (let p in props){
    html_text = html_text + p + ": " + props[p] + "<br>";
  }
  return html_text + "</div>";
}

