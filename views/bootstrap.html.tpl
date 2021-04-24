<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
	
	<!-- <h2>1</h2> -->
	<!-- <button type="button" class="btn btn-default" aria-label="Left Align"> -->
  <!-- <span class="glyphicon glyphicon-align-left" aria-hidden="true"></span> -->
<!-- </button> -->

<!-- <button type="button" class="btn btn-default btn-lg"> -->
  <!-- <span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span> Star -->
<!-- </button> -->



<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <!-- <button id="produce" type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="true"> -->
        <!-- <span class="sr-only">Toggle navigation</span> -->
        <!-- <span class="icon-bar"></span> -->
        <!-- <span class="icon-bar"></span> -->
        <!-- <span class="icon-bar"></span> -->
      <!-- </button> -->
	  <ul class="nav nav-pills">
		  <li role="presentation" class="active"><a id="mock" class="navbar-brand" data-toggle="collapse" data-parent="#accordion" aria-expanded="true" href="#collapseOne" onClick="shiftTab('mock')">MOCK使用</a></li>
		  <li role="presentation" ><a id="ts" class="navbar-brand" data-toggle="collapse" data-parent="#accordion" aria-expanded="true" href="#collapseTwo" onClick="shiftTab('ts')">TS使用</a></li>
	</ul>
      
      <!-- <a class="navbar-brand" href="#">使用说明</a> -->
      <!-- <a class="navbar-brand" href="#">使用说明</a> -->

    </div>
	
  </div><!-- /.container-fluid -->

</nav>

<div id="collapseOne" name="collapse" class="panel-collapse collapse in">
	<div class="panel-body">
	<!-- <p class="navbar-text">该服务主要是解决三方服务环境不便利，可通过自行模拟配置三方服务的回参.</p><br> -->
	<b>应用范围</b>
	<p>该服务主要是解决三方服务环境不便利，可通过自行模拟配置三方服务的回参.</p>
	
    <strong>配置说明</strong>
    <p>代码的config目录下， 在response.json文件里面进行配置；json文件中的key为实际请求的接口url，value为接口的响应参数</p>
    <b>配置样例</b>
    <p>配置信息为：
    "chenk": {"name": "hello", "data": {"error_no": "0", "error_info": "nomal", "data_list": [1, 2, 3, 4]}}
    <br>则接口请求地址为 IP:PORT/mock/chenk(url中的mock是默认路由前缀)<br>
    响应内容为： {"name": "hello", "data": {"error_no": "0", "error_info": "nomal", "data_list": [1, 2, 3, 4]}}
	</p>
	<b>查看配置</b>
	<p> 查看response.json文件， 访问URL： <a href="/mock/fetchResponseJsonFile" target="_blank">/mock/fetchResponseJsonFile</a>
	&nbsp;&nbsp;<a href="/mock/downloadResponseJsonFile">点击下载</a>
	</p>
    <b>配置更新</b>
		<!-- <p><form action="/upload" method="post" enctype="multipart/form-data"> -->
	  <!-- Category:      <input type="text" name="category" /> -->
	  <!-- Select a file: <input type="file" name="upload" /> -->
	  <!-- <input type="submit" value="Start upload" /> -->
	<!-- </form></p> -->
	<p><form class="navbar-form navbar-left" action="/mock/uploadResponseJsonFile" method="post" enctype="multipart/form-data">
		<!-- <div class="form-group"> -->
		<!-- <input type="text" class="form-control" placeholder="Search"> -->
		<!-- </div> -->
		<!-- <input type="file" class="input-group" name="/mock/uploadResponseJsonFile" /> -->
		<div class="input-group">
		  <input type="file" class="form-control" name="upload" placeholder="Recipient's username" aria-describedby="basic-addon2">
		  <!-- <span class="input-group-addon" id="basic-addon2">@example.com</span> -->
		</div>
		<button type="submit" class="btn btn-default" onclick="alert" >上传更新</button>
		
	</form></p>
	</div>
</div>


<div id="collapseTwo" name="collapse" class="panel-collapse collapse">
	<div class="panel-body">
	<!-- <p class="navbar-text">该服务主要是解决三方服务环境不便利，可通过自行模拟配置三方服务的回参.</p><br> -->
	<b>应用范围</b>
	<p>TS.</p>
	
    <strong>配置说明</strong>
    <p></p>
    <b>配置样例</b>
    <p>
	</p>
	<b>查看配置</b>
	<p> 查看response.json文件， 访问URL： <a href="/mock/fetchResponseJsonFile" target="_blank">/mock/fetchResponseJsonFile</a>
	&nbsp;&nbsp;<a href="/mock/downloadResponseJsonFile">点击下载</a>
	</p>
    <b>配置更新</b>
		<!-- <p><form action="/upload" method="post" enctype="multipart/form-data"> -->
	  <!-- Category:      <input type="text" name="category" /> -->
	  <!-- Select a file: <input type="file" name="upload" /> -->
	  <!-- <input type="submit" value="Start upload" /> -->
	<!-- </form></p> -->
	<p><form class="navbar-form navbar-left" action="/mock/uploadResponseJsonFile" method="post" enctype="multipart/form-data">
		<!-- <div class="form-group"> -->
		<!-- <input type="text" class="form-control" placeholder="Search"> -->
		<!-- </div> -->
		<!-- <input type="file" class="input-group" name="/mock/uploadResponseJsonFile" /> -->
		<div class="input-group">
		  <input type="file" class="form-control" name="upload" placeholder="Recipient's username" aria-describedby="basic-addon2">
		  <!-- <span class="input-group-addon" id="basic-addon2">@example.com</span> -->
		</div>
		<button type="submit" class="btn btn-default" onclick="alert" >上传更新</button>
		
	</form></p>
	</div>
</div>


	<!-- <div class="alert alert-danger" role="alert"> -->
		<!-- <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> -->
		<!-- <span class="sr-only">Error:</span> -->
		<!-- Enter a valid email address -->
	<!-- </div> -->
  </body>
  
<script>
function shiftTab(tab){
	var tabs = ["mock", "ts"];
	var i = 0;
	for (;tabs[i];){
		var elementA = document.getElementsByTagName("a")[i];
		var elementCollapse = document.getElementsByClassName("collapse")[i];
		var elementLi = document.getElementsByTagName("li")[i];
		<!-- 导航栏切换 -->
		if (tabs[i] == tab) {
			if (elementLi.getAttribute("class") == "active") {
				elementLi.setAttribute("class", "");
			}else{
				elementLi.setAttribute("class", "active");
			}
			
			elementA.setAttribute("class", "navbar-brand");
			elementA.setAttribute("aria-expanded", true);
			<!-- elementCollapse.setAttribute("class", "panel-collapse collapse"); -->
			<!-- elementCollapse.setAttribute("aria-expanded", false); -->
		}else{
			if (elementLi.getAttribute("class") == "active") {
				elementLi.setAttribute("class", "");
				}
			elementA.setAttribute("class", "navbar-brand");
			elementA.setAttribute("aria-expanded", false);
			elementCollapse.setAttribute("class", "panel-collapse collapse");
			elementCollapse.setAttribute("aria-expanded", false);
		}
		i += 1;

	}
	
	
}
</script>
</html>