// var client = new Faye.Client('http://localhost:9292/faye');
// var client = new Faye.Client('http://shrouded-cliffs-5129.herokuapp.com/faye');

var client = new Faye.Client('http://localhost:9292/faye');


// Logger = {
//   incoming: function(message, callback) {
//     console.log('incoming', message);
//     callback(message);
//   },
//   outgoing: function(message, callback) {
//     console.log('outgoing', message);
//     callback(message);
//   }
// };
//
// client.addExtension(Logger);

function getMessage(newMessage) {
  var myMessage = newMessage;
  if (myMessage.light !== null) {
    console.log("This is getMessage function", myMessage.light);
  }
}

var myReading = {};

var subscription = client.subscribe('/arduino', function(data) {
  console.log("Sensors:", data);
  // $("#blob").html(data.light);
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

// subscription.then(function() {
//   console.log("Subscription is now active!");
//   var publication = client.publish('/arduino', {
//
//     // text: "Hi There"
//   });
//   publication.then(function() {
//     console.log("message sent to the server");
//   }, function(error) {
//     console.log("There was a problem: " + error.message);
//   });
// });
