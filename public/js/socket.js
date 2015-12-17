var client = new Faye.Client('http://shrouded-cliffs-5129.herokuapp.com/faye');

function getMessage(newMessage) {
  var myMessage = newMessage;
  if (myMessage.light !== null) {
    console.log("This is getMessage function", myMessage.light);
  }
}

var myReading = {};

var subscription = client.subscribe('/arduino', function(data) {
  console.log("Sensors:", data);
  console.log(data.light);
  if (data.light < 300) {
    console.log("getting dark");
    nightCSS();
  } else if (data.light < 150) {
    playSanta();
  } else {
    console.log("getting light again");
    dayCSS();
  };
  myChart.chart.load({
    columns: [
      ['data', (data.light/1024) * 100]
    ]
  });
  myTempChart.chart.load({
    columns: [
      ['data', (data.temp * 50) / 1024]
    ]
  });
});
