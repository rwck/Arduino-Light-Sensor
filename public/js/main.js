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

function bounceHandlers() {
  bounceHeading();
  bounceLight();
  bounceTemp();
}

function bounceHeading() {
  $(".heading").mouseenter(function() {
    $(this).addClass("bounce");
  });
  $(".heading").mouseleave(function() {
    $(this).removeClass("bounce");
  });
}

function bounceLight() {
  $(".bounce-light").mouseenter(function() {
    $("#light-chart").addClass("bounce");
  });
  $(".bounce-light").mouseleave(function() {
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
    function() {
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

function freakyCSS() {
  $(".main-container").css({
    transform: "rotateY(180deg) rotateX(180deg)"
  }).css("background-color", "yellow");
  setTimeout(
    function() {
      $(".main-container").css({
        transform: "rotateY(180deg)"
      }).css("background-color", "blue"), 500;
    }
  )
}



$(document).ready(function() {
  bounceHandlers();
  bounceEverything();
});
