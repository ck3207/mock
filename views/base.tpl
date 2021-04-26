<!DOCTYPE html>
<html lang="zh-CN">

%include

  
% include('scripts.html', title="scripts title")

<body>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js"></script>
	
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
	<span class="glyphicon glyphicon-star-empty" aria-hidden="true" ></span> <b>应用范围</b>
	<p><span class="glyphicon glyphicon-arrow-right" aria-hidden="true" ></span>该服务主要是解决三方服务环境不便利，可通过自行模拟配置三方服务的回参.</p>
	
    <span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span> <strong>配置说明</strong>
	
    <p><span class="glyphicon glyphicon-arrow-right" aria-hidden="true" ></span>
	代码的config目录下， 在response.json文件里面进行配置；json文件中的key为实际请求的接口url，value为接口的响应参数</p>
    <span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span> <b>配置样例</b>
    <p><span class="glyphicon glyphicon-arrow-right" aria-hidden="true" ></span>配置信息为：
    "chenk": {"name": "hello", "data": {"error_no": "0", "error_info": "nomal", "data_list": [1, 2, 3, 4]}}
    <br>则接口请求地址为 IP:PORT/mock/chenk(url中的mock是默认路由前缀)<br>
    响应内容为： {"name": "hello", "data": {"error_no": "0", "error_info": "nomal", "data_list": [1, 2, 3, 4]}}
	</p>
	<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span> <b>查看配置</b>
	<p> <span class="glyphicon glyphicon-arrow-right" aria-hidden="true" ></span>查看response.json文件， 访问URL： <a href="/static/config/response.json" target="_blank">/static/config/response.json</a>
	&nbsp;&nbsp;<a href="/mock/downloadResponseJsonFile">点击下载</a>
	</p>
	<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span> <b>配置更新</b>
	<p><form name="uploadForm" class="navbar-form navbar-left" action="/mock/uploadResponseJsonFile" method="post" enctype="multipart/form-data" onsubmit="return checkUploadButton(this.form)">
			<!-- <div class="form-group"> -->
			<!-- <input type="text" class="form-control" placeholder="Search"> -->
			<!-- </div> -->
			<!-- <input type="file" class="input-group" name="/mock/uploadResponseJsonFile" /> -->
			<div class="input-group">
			  <input type="file" class="form-control" name="upload" placeholder="Recipient's username" aria-describedby="basic-addon2" required onchange="checkFile(this)"></input>
			  <!-- <span class="input-group-addon" id="basic-addon2">@example.com</span> -->
			</div>
			<button type="submit" class="btn btn-default" ><span class="glyphicon glyphicon-sort" aria-hidden="true"></span> 上传更新</button>
			
	</form></p>
	<div class="alert alert-danger" role="alert" style="display:none;">
		<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
		<span class="sr-only" aria-hidden="false">Error:</span>
		Enter a valid email address
	</div>
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
		<div class="input-group">
		  <input type="file" class="form-control" name="upload" placeholder="Recipient's username" aria-describedby="basic-addon2">
		  <!-- <span class="input-group-addon" id="basic-addon2">@example.com</span> -->
		</div>
		<!-- <input type="submit" class="btn btn-default" >上传更新</input> -->
		<input type="button" name="submit" class="btn btn-default" value="上传更新" onclick="checkUploadButton()" >
	</form></p>
	
	
	</div>
</div>


  </body>
  

</html>