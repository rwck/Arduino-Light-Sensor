function switchCSS() {
  if (gon.text == "on") {
    turnBlue();
  } else {
    turnYellow();
  }
}

// function testLightLevel() {
//   if (gon.light_level < 400) {
//     turnBlue();
//   } else {
//     turnYellow();
//   }
// }

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

// testLightLevel();
// switchCSS();
