					<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <link rel="shortcut icon" href="img/favicon.html">

    <title>权限</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

  <section id="container" class="">
      <!--header start-->
      <#include "head.ftl"/>
      <!--header end-->
      <!--sidebar start-->
      <#include "left.ftl"/>
      <!--sidebar end-->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
              <!-- page start-->
              <div class="row">
                  <div class="col-lg-12">
                        <section class="panel">
                          <header class="panel-heading">
                              添加权限
                          </header>
                          <div class="panel-body">
                               <form role="form" id="form">
                                  <div class="form-group">
                                      <label for="exampleInputEmail1">名称</label>
                                      <input  name="permissionName" class="form-control" id="permissionName" placeholder="Enter permissionName">
                                  </div>                                
                                  <div class="form-group">
                                      <label for="exampleInputPassword1">权限</label>
                                      <input  name="permission" class="form-control" id="permission" placeholder="permission">
                                  </div>
                                  <div class="form-group">
                                      <label for="exampleInputPassword1">父级名称</label>
                                      <input  name="parentName" class="form-control" id="parentName" placeholder="parentName">
                                  </div>
                                  <div class="form-group">
                                      <label for="exampleInputPassword1">父级</label>
                                      <input name="parent" class="form-control" id="parent" placeholder="parent">
                                  </div>
                                                               
                                  <button class="btn btn-info" type="submit" >Submit</button>
                            	</form>

                          </div>
                      </section>
                  </div>
              </div>
              <!-- page end-->
          </section>
      </section>
      <!--main content end-->
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
    <script type="text/javascript" src="assets/data-tables/jquery.dataTables.js"></script>
    <script type="text/javascript" src="assets/data-tables/DT_bootstrap.js"></script>


    <!--common script for all pages-->
    <script src="js/common-scripts.js"></script>

    <!--script for this page only-->
    <script src="js/dynamic-table.js"></script>

	<script type="text/javascript">
	$(document).ready(function(){
		 $("#form").submit(function(event){
		    event.preventDefault();
			$.ajax({
				type:"post",
				dataType:"json",
				url:"/managecenter/addPermission",
				data:$("#form").serialize(),
				error: function(result){
					alert(result);
				},
				success: function(data) {	
					alert(data.body)
					if(data.code=="0"){
						window.location.href="/managecenter/getPermission";
					}else{
						window.location.href="/managecenter/addPermission";
					}		
				}
			});
		});
	});
	</script>
  </body>
</html>
					