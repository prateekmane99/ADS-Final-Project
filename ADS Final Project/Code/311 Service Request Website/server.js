  var express = require('express');
var http = require('http');
var PythonShell = require('python-shell');
var ut = require('date-utils');

var app = express();

app.use( express.static(__dirname));

app.get('/', function(req, res) {

	return res.sendFile(__dirname + '/Pages/index.html');
    //return res.sendFile(__dirname + '/indi.html');

});




app.get('/query1' , function(req, res) {

  var DS_type = req.param('v6'); 
  var page_type = req.param('v7'); 
 //console.log(DS_type) 

  if(page_type == "CSV")
  { 
      var row_1 = req.param('d'); 
      console.log(row_1) 
      var header = req.param('h'); 
   
   var options = {
      //mode: 'text',
      args: [DS_type, page_type, row_1.split(','), header.split(',')]
   };

   PythonShell.run('abc.py', options, function (err, results) {
     if (err) throw err;
    // results is an array consisting of messages collected during execution
    //console.log(results)
    output = JSON.parse(results);
    var scoredLabels = output.Results.output1.value.Values[0][0];
    var scoreProb = output.Results.output1.value.Values[0][1];
    //console.log(scoredLabels)
   // console.log(scoreProb)
    var scoreProb = 0;

    console.log('POP %j', output);
    res.send(row_1+','+Math.round(scoredLabels)+','+scoreProb);

  });

  }
  else
  {
      var header = ["REASON", "TYPE", "Department", "Zipcode", "flag", "opendate", "openmonth", "openyear", "openweekdaynum"];
      var reaso = req.param('v1'); 
      var type = req.param('v2'); 
      var dept = req.param('v3'); 
      var zipcde = req.param('v3_'); 
      var flg = req.param('v4'); 
      var opendte = req.param('v5'); 
      var openmth = req.param('v51'); 
      var openyr = req.param('v52'); 
      var openweekdynm = req.param('v53'); 
    

      var valuess = new Array();
      valuess.push(reaso);
      valuess.push(type);
      valuess.push(dept);
      valuess.push(zipcde);
      valuess.push(flg);
      valuess.push(opendte);
      valuess.push(openmth);
      valuess.push(openyr);
      valuess.push(openweekdynm);



    var options = {
      //mode: 'text',
      //args: [type, header, acc, variable, kw, d, mnth]
      args: [DS_type, page_type, header, valuess]
    };

    PythonShell.run('abc.py', options, function (err, results) {
      if (err) throw err;
    // results is an array consisting of messages collected during execution
    //console.log(results)
    output = JSON.parse(results);
    var scoredLabels = output.Results.output1.value.Values[0][0];
    //var scoreProb = output.Results.BostonPropertyOutput.value.Values[0][1];
    //var scoreProb = 0;

    console.log('POP %j', output);
    //res.send(scoredLabels+','+scoreProb);
    res.send(scoredLabels);
    
  });
  
  }

});


http.createServer(app).listen(4030, function() {
	console.log("LOADED SERVER");
});