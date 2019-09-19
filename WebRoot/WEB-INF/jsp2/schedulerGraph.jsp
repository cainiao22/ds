<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta charset="utf-8">
<title>任务调度图</title>

<script src="https://d3js.org/d3.v4.min.js" charset="utf-8"></script>
<script src="assets/dagre-d3/scripts/vendor2.js"></script>

<style>

    body {
        position: fixed;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        margin: 0;
        padding: 0;
        font-family: "Helvetica Neue", Helvetica, Arial, sans-serf;
        background: #333;
    }


    @-webkit-keyframes flash {
        0%, 50%, 100% {
            opacity: 1;
        }

        25%, 75% {
            opacity: 0.2;
        }
    }

    @keyframes flash {
        0%, 50%, 100% {
            opacity: 1;
        }

        25%, 75% {
            opacity: 0.2;
        }
    }

    .warn {
        -webkit-animation-duration: 5s;
        animation-duration: 5s;
        -webkit-animation-fill-mode: both;
        animation-fill-mode: both;
        -webkit-animation-iteration-count: 1;
        animation-iteration-count: 1;
    }

    .live.map {
        width: 100%;
        height: 100%;
    }

    svg {
        width: 100%;
        height: 100%;
        overflow: hidden;
    }

    .live.map text {
        font-weight: 300;
        font-size: 14px;
    }

    .live.map .node rect {
        stroke-width: 1.5px;
        stroke: #bbb;
        fill: #666;
    }

    .live.map .status {
        height: 100%;
        width: 15px;
        display: block;
        float: left;
        border-top-left-radius: 5px;
        border-bottom-left-radius: 5px;
        margin-right: 4px;
    }

    .live.map .success .status {
        background-color: #3fff59;
    }

    .live.map .running .status {
        background-color: #4df3ff;
    }

    .live.map .waitting .status {
        background-color: #ffed68;
    }

    .live.map .failed .status {
        background-color: #f77;
    }

    .live.map .unstarted .status {
        background-color:#fff;
    }



    .warn {
        -webkit-animation-name: flash;
        animation-name: flash;
    }

    .live.map .consumers {
        margin-right: 2px;
    }

    .live.map .consumers,
    .live.map .name {
        margin-top: 4px;
    }

    .live.map .consumers:after {
        content: "x";
    }

    .live.map .queue {
        display: block;
        float: left;
        width: 130px;
        height: 20px;
        font-size: 12px;
        margin-top: 2px;
    }

    .live.map .node g div {
        width: 200px;
        height: 40px;
        color: #fff;
    }

    .live.map .node g div span.consumers {
        display: inline-block;
        width: 20px;
    }

    .live.map .edgeLabel text {
        width: 50px;
        fill: #fff;
    }

    .live.map .edgePath path {
        stroke: #999;
        stroke-width: 1.5px;
        fill: #999;


    }
</style>

<body>
<div class="live map">
    <svg><g/></svg>
</div>

<script>
    Date.prototype.format = function(fmt) {
        var o = {
            "M+" : this.getMonth()+1,                 //月份
            "d+" : this.getDate(),                    //日
            "h+" : this.getHours(),                   //小时
            "m+" : this.getMinutes(),                 //分
            "s+" : this.getSeconds(),                 //秒
            "q+" : Math.floor((this.getMonth()+3)/3), //季度
            "S"  : this.getMilliseconds()             //毫秒
        };
        if(/(y+)/.test(fmt)) {
            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
        }
        for(var k in o) {
            if(new RegExp("("+ k +")").test(fmt)){
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
            }
        }
        return fmt;
    }
    var workers = JSON.parse('${nodes}');

    // Set up zoom support
    var svg = d3.select("svg"),
        inner = svg.select("g"),
        zoom = d3.zoom().on("zoom", function() {
            inner.attr("transform", d3.event.transform);
        });
    svg.call(zoom);

    var render = new dagreD3.render();

    // Left-to-right layout
    var g = new dagreD3.graphlib.Graph();
    g.setGraph({
        nodesep: 70,
        ranksep: 50,
        rankdir: "LR",
        marginx: 20,
        marginy: 20
    });

    function draw(isUpdate) {
        for (var id in workers) {
            var worker = workers[id];
            // var className = worker.consumers ? "running" : "stopped";
            //  if (worker.count > 10000) {
            className = "running";
            if(worker.status == -1){
                className = "unstarted";
            }else if(worker.status == 0){
                className = "unstarted";
            }else if(worker.status == 1){
                className = "success";
            }else if(worker.status == 2){
                className = "failed";
            }else if(worker.status == 3){
                className = "running";
            }else if(worker.status == 4){
                className = "waitting";
            }
            //}
            var html = "<div>";
            html += "<span class=status></span>";
            // html += "<span class=consumers>"+worker.consumers+"</span>";
            var currentClass = '';
            if(worker.label == 'current'){
                currentClass = "style='color: #FF6CE4'"
            }
            html += "<span class=success " + currentClass + ">"+worker.name+"</span>";
            // html += "<span class=queue><span class=counter>"+worker.count+"</span></span>";
            html += "</div>";
            g.setNode(id, {
                labelType: "html",
                label: html,
                rx: 5,
                ry: 5,
                padding: 0,
                class: className
            });

            if (worker.childrenIdList) {
                for (var index in worker.childrenIdList) {

                    g.setEdge(worker.childrenIdList[index], id, {
                        // label: worker.inputThroughput + "/s",
                        width: 40
                    });
                }
            }
        }

        inner.call(render, g);
        var selections = inner.selectAll("g.node");
        selections .on('click', function (jobId) {
            var date = new Date().format("yyyy-MM-dd");
            var queryStartTime = date + " 00:00:00";
            var queryEndTime = date + " 23:59:59";
            var queryString = "jobId=" + jobId + "&queryStartTime=" + queryStartTime + "&queryEndTime=" + queryEndTime;
            window.open("schedulerJobLogList?" + queryString);
        });
        // Zoom and scale to fit
        var graphWidth = g.graph().width + 80;
        var graphHeight = g.graph().height + 40;
        var width = parseInt(svg.style("width").replace(/px/, ""));
        var height = parseInt(svg.style("height").replace(/px/, ""));
        var zoomScale = Math.min(width / graphWidth, height / graphHeight);
        var translateX = (width / 2) - ((graphWidth * zoomScale) / 2)
        var translateY = (height / 2) - ((graphHeight * zoomScale) / 2);
        // var svgZoom = isUpdate ? svg.transition().duration(500) : svg;
        //  svgZoom.call(zoom.transform, d3.zoomIdentity.translate(translateX, translateY).scale(zoomScale));

    }

    // Initial draw, once the DOM is ready
    document.addEventListener("DOMContentLoaded", draw);
</script>
</body>
</html>
