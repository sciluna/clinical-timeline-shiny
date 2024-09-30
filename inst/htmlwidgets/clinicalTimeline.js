HTMLWidgets.widget({

  name: 'clinicalTimeline',

  type: 'output',

  factory: function(el, width, height) {

    var timeline = clinicalTimeline();

    return {

      renderValue: function(x) {
        timeline.data(x.data);  // set data
        timeline.divId("#" + el.id);  // set div
        // set options
        if(x.width) {
          timeline.width(x.width);
        }
        if(x.enableTrackTooltips) {
          timeline.enableTrackTooltips(x.enableTrackTooltips);
        }
        if(x.orderAllTooltipTables) {
          timeline.orderAllTooltipTables(x.orderAllTooltipTables)
        }
        if(x.splitByClinicalAttributes) {
          x.splitByClinicalAttributes.forEach(function(arr){
            timeline.splitByClinicalAttributes(arr[0], arr[1]);
          });
        }
        if(x.sizeByClinicalAttribute) {
          x.sizeByClinicalAttribute.forEach(function(arr) {
            timeline.sizeByClinicalAttribute(arr[0], arr[1]);
          });
        }
        if(x.plugins) {
          var pluginArr = [];
          x.plugins.forEach(function(plugin){
            var ClassReference = eval(plugin.obj);
            var obj;
            if(plugin.obj == "clinicalTimelineVerticalLine") {
              obj = new ClassReference("vt", {
                tooltipControllerId: plugin.tooltipControllerId || "#tooltip-controller",
                hoverBegin: plugin.hoverBegin || 200, 
                hoverEnd: plugin.hoverEnd || 770
              });
            } else if(plugin.obj == "configCheckManager") {
              obj = new ClassReference(null, {
                configUlId: "#timeline-wrapper #config-div #config-dropdown"
              });
            } else if(plugin.obj == "clinicalTimelineExporter") {
              obj = new ClassReference("Export", {
                exportDivId : "#export-div"
              });
            } else {
              obj = new ClassReference();
            }
            var objToAdd = {obj: obj, enabled: plugin.enabled};
            pluginArr.push(objToAdd);
          });
          timeline.plugins(pluginArr);
        }
        timeline.collapseAll();
        timeline();
      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});