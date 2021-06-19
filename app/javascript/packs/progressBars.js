window.addEventListener("load", function () {
  var ProgressBar = require("progressbar.js");
  var meanSOCBar = new ProgressBar.Line("#meanSOCBar", {
    strokeWidth: 2,
    easing: "easeInOut",
    duration: 1400,
    color: "#FFDA0D",
    trailColor: "#eee",
    trailWidth: 0.5,
    svgStyle: { width: "100%", height: "100%" },
  });
  var soilHealthBar = new ProgressBar.Line("#soilHealthBar", {
    strokeWidth: 4,
    easing: "easeInOut",
    duration: 1400,
    color: "#EA5BA8",
    trailColor: "#eee",
    trailWidth: 1,
    svgStyle: { width: "100%", height: "100%" },
  });
  var ecologicalFocusAreaBar = new ProgressBar.Line("#ecologicalFocusAreaBar", {
    strokeWidth: 4,
    easing: "easeInOut",
    duration: 1400,
    color: "#FBB03B",
    trailColor: "#eee",
    trailWidth: 1,
    svgStyle: { width: "100%", height: "100%" },
  });
  var sustainablePracticesBar = new ProgressBar.Line(
    "#sustainablePracticesBar",
    {
      strokeWidth: 4,
      easing: "easeInOut",
      duration: 1400,
      color: "#AED7DD",
      trailColor: "#eee",
      trailWidth: 1,
      svgStyle: { width: "100%", height: "100%" },
    }
  );
  var meanSOCProgress = document
    .getElementById("meanSOCBar")
    .getAttribute("progress");
  meanSOCBar.animate(meanSOCProgress);
  var soilHealthProgress = document
    .getElementById("soilHealthBar")
    .getAttribute("progress");
  soilHealthBar.animate(soilHealthProgress);
  var ecologicalFocusAreaProgress = document
    .getElementById("ecologicalFocusAreaBar")
    .getAttribute("progress");
  ecologicalFocusAreaBar.animate(ecologicalFocusAreaProgress);
  var sustainablePracticesProgress = document
    .getElementById("sustainablePracticesBar")
    .getAttribute("progress");
  sustainablePracticesBar.animate(sustainablePracticesProgress);
});
