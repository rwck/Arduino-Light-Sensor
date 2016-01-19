function switchCSS() {
  if (gon.text == "on") {
    turnBlue();
  } else {
    turnYellow();
  }
}

function turnBlue() {
  $(".main-container").removeClass().addClass("main-container switched-off");
}

function turnYellow() {
  $(".main-container").removeClass().addClass("main-container switched-on");
}

function placeHandlers() {
  // switchHandler();
  bounceHeading();
  buttonHandler();
  // bounceLight();
  // bounceTemp();
}

function buttonHandler() {
  $("#click-message").click(function(event) {
    switchOn();
  });
}

function bounceHeading() {
  $(".heading").mouseenter(function(event) {
    $(this).addClass("bounce");
  });
  $(".heading").mouseleave(function(event) {
    $(this).removeClass("bounce");
  });
}

function bounceLight() {
  $(".bounce-light").mouseenter(function(event) {
    $("#light-chart").addClass("bounce");
  });
  $(".bounce-light").mouseleave(function(event) {
    $("#light-chart").removeClass("bounce");
  });
}

function bounceTemp() {
  $(".bounce-temp").mouseenter(function() {
    $("#temp-chart").addClass("bounce");
  });
  $(".bounce-temp").mouseleave(function() {
    $("#temp-chart").removeClass("bounce");
  });
}

function bounceEverything() {
  $(".main-container").addClass("bounce");
  setTimeout(
    function(event) {
      $(".main-container").removeClass("bounce");
    }, 2000);
}

function nightCSS() {
  $(".main-container").addClass("night");
  $(".c3-gauge-value").css({
    fill: "#fff"
  });
}

function dayCSS() {
  $(".main-container").removeClass("night");
  $(".c3-gauge-value").css({
    fill: "#000"
  });
}

function spinMeCSS() {
  $(".main-container").addClass("spinner");
  $(".a-chart").hide();
  $(".hidden-message").show();
}

function unSpinMeCSS() {
  $(".main-container").removeClass("spinner");
  $(".a-chart").show();
  $(".hidden-message").hide();
}

function freakyCSS() {
  $(".main-container").css({
    transform: "rotateY(180deg) rotateX(180deg)"
  }).css("background-color", "yellow");
  setTimeout(
    function() {
      $(".main-container").css({
        transform: "rotateY(180deg)"
      }).css("background-color", "blue"), 1000;
    }
  );
}

$(document).ready(function() {
  placeHandlers();
  bounceEverything();
});
