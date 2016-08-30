<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <link rel="shortcut icon" href="img/favicon.html">

    <title>修改-利润表</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="assets/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/bootstrap-colorpicker/css/colorpicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/bootstrap-daterangepicker/daterangepicker.css" />

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
            
             
                      <section class="panel">
                          <header class="panel-heading">
                            利润表
                          </header>
                          <div class="panel-body">
                              <form class="form-horizontal tasi-form" id="form">
                              	 <div class="form-group">
                                      <label class="control-label col-lg-2" ></label>                                                                                                             	                                   
                                      <div class="col-lg-10">                                         	                                                                       	 
                                          <div class="input-group m-bot15">
                                              <span class="input-group-addon">企业注册号</span>
                                              <input type="text" class="form-control" placeholder="企业注册号" name="enterpriseRegistrationNumber" id="enterpriseRegistrationNumber" value=${EnterpriseFinancialData.enterpriseRegistrationNumber}>                                             
                                          </div>
                                          <#list EnterpriseFinancialData.profitStatements as profitStatement>
                                            <div class="input-group m-bot15">
                                              <div class="input-append date" id="dpYears" data-date="12-02-2012"
                                                       data-date-format="dd-mm-yyyy" data-date-viewmode="years">
                                                      <input class="form-control" size="16" type="text" value=${profitStatement.date?string("dd-MM-yyyy")} readonly name="year" id="year">
                                                      <span class="add-on"><i class="icon-calendar"></i></span>
                                                  </div>                                             
                                          </div>
                                       </div>
                                                                                                    
                            </div>
                              
                              
                                  <div class="form-group">
                                      <label class="control-label col-lg-2" >营业内：</label>
                                      <div class="col-lg-10">
                                       	  <div class="input-group m-bot15">                                            
                                              <label class="control-label">流入：</label>                                            
                                          </div> 
                                          <div class="input-group m-bot15">
                                              <span class="input-group-addon">营业收入</span>
                                              <input type="text" class="form-control" placeholder="本年累计数" name="YYN_YYSR_LR_BN" value=${profitStatement.content.营业内.流入.营业收入.本年累计数}>
                                              <input type="text" class="form-control" placeholder="上年累计数" name="YYN_YYSR_LR_SN" value=${profitStatement.content.营业内.流入.营业收入.上年累计数}>
                                          </div>

                                          <div class="input-group m-bot15">
                                              <span class="input-group-addon">公允介值变动收益</span>
                                              <input type="text" class="form-control" placeholder="本年累计数" name="YYN_GYJZBDSY_LR_BN" value=${profitStatement.content.营业内.流入.公允介值变动收益.本年累计数}>
                                              <input type="text" class="form-control" placeholder="上年累计数" name="YYN_GYJZBDSY_LR_SN" value=${profitStatement.content.营业内.流入.公允介值变动收益.上年累计数}>
                                          </div>
                                          <div class="input-group m-bot15">
                                              <span class="input-group-addon">投资收益</span>
                                              <input type="text" class="form-control" placeholder="本年累计数" name="YYN_TZSY_LR_BN" value=${profitStatement.content.营业内.流入.投资收益.本年累计数}>
                                              <input type="text" class="form-control" placeholder="上年累计数" name="YYN_TZSY_LR_SN" value=${profitStatement.content.营业内.流入.投资收益.上年累计数}>
                                          </div>
                                          
                                          <div class="input-group m-bot15">
                                              <span class="input-group-addon">对联营企业和合营企业的投资收益</span>
                                              <input type="text" class="form-control" placeholder="本年累计数" name="YYN_DLYQYHHYQYDTZSY_LR_BN" value=${profitStatement.content.营业内.流入.对联营企业和合营企业的投资收益.本年累计数}>
                                              <input type="text" class="form-control" placeholder="上年累计数" name="YYN_DLYQYHHYQYDTZSY_LR_SN" value=${profitStatement.content.营业内.流入.对联营企业和合营企业的投资收益.上年累计数}>
                                          </div>
                                          <div class="input-group m-bot15">                                            
                                              <label class="control-label">流出：</label>                                            
                                          </div> 
                                           <div class="input-group m-bot15">
                                              <span class="input-group-addon">营业成本</span>
                                              <input type="text" class="form-control" placeholder="本年累计数" name="YYN_YYCB_LC_BN" value=${profitStatement.content.营业内.流出.营业成本.本年累计数}>
                                              <input type="text" class="form-control" placeholder="上年累计数" name="YYN_YYCB_LC_SN" value=${profitStatement.content.营业内.流出.营业成本.上年累计数}>
                                          </div>
                                          
                                           <div class="input-group m-bot15">
                                              <span class="input-group-addon">营业税金及附加</span>
                                              <input type="text" class="form-control" placeholder="本年累计数" name="YYN_YYSJJFJ_LC_BN" value=${profitStatement.content.营业内.流出.营业税金及附加.本年累计数}>
                                              <input type="text" class="form-control" placeholder="上年累计数" name="YYN_YYSJJFJ_LC_SN" value=${profitStatement.content.营业内.流出.营业税金及附加.上年累计数}>
                                          </div>
                                          
                                           <div class="input-group m-bot15">
                                              <span class="input-group-addon">销售费用</span>
                                              <input type="text" class="form-control" placeholder="本年累计数" name="YYN_SSFY_LC_LC_BN" value=${profitStatement.content.营业内.流出.销售费用.本年累计数}>
                                              <input type="text" class="form-control" placeholder="上年累计数" name="YYN_SSFY_LC_LC_SN" value=${profitStatement.content.营业内.流出.销售费用.上年累计数}>
                                          </div>
                                          
                                           <div class="input-group m-bot15">
                                              <span class="input-group-addon">管理费用</span>
                                              <input type="text" class="form-control" placeholder="本年累计数" name="YYN_GLFY_LC_BN" value=${profitStatement.content.营业内.流出.管理费用.本年累计数}>
                                              <input type="text" class="form-control" placeholder="上年累计数" name="YYN_GLFY_LC_SN" value=${profitStatement.content.营业内.流出.管理费用.上年累计数}>
                                          </div>
                                           <div class="input-group m-bot15">
                                              <span class="input-group-addon">财务费用</span>
                                              <input type="text" class="form-control" placeholder="本年累计数" name="YYN_CWFY_LC_BN" value=${profitStatement.content.营业内.流出.财务费用.本年累计数}>
                                              <input type="text" class="form-control" placeholder="上年累计数" name="YYN_CWFY_LC_SN" value=${profitStatement.content.营业内.流出.财务费用.上年累计数}>
                                          </div>
                                           <div class="input-group m-bot15">
                                              <span class="input-group-addon">资产减值损失</span>
                                              <input type="text" class="form-control" placeholder="本年累计数" name="YYN_CCJZSS_LC_BN" value=${profitStatement.content.营业内.流出.资产减值损失.本年累计数}>
                                              <input type="text" class="form-control" placeholder="上年累计数" name="YYN_CCJZSS_LC_SN" value=${profitStatement.content.营业内.流出.资产减值损失.上年累计数}>
                                          </div>
                                                                      
                                      </div>
                                  </div>
                                  
                                  
                                  <div class="form-group">
                                      <label class="control-label col-lg-2" >营业外：</label>
                                      <div class="col-lg-10">
                                        <div class="input-group m-bot15">                                            
                                              <label class="control-label">流入：</label>                                            
                                          </div> 
                                          <div class="input-group m-bot15">
                                              <span class="input-group-addon">营业外收入</span>
                                              <input type="text" class="form-control" placeholder="本年累计数" name="YYW_YYWSR_LR_BN" value=${profitStatement.content.营业外.流入.营业外收入.本年累计数}>
                                              <input type="text" class="form-control" placeholder="上年累计数" name="YYW_YYWSR_LR_SN" value=${profitStatement.content.营业外.流入.营业外收入.上年累计数}>
                                          </div>
                                          <div class="input-group m-bot15">                                           
                                              <label class="control-label">流出：</label>                                            
                                          </div> 
                                          <div class="input-group m-bot15">
                                              <span class="input-group-addon">营业外支出</span>
                                              <input type="text" class="form-control" placeholder="本年累计数" name="YYW_YYWZC_LC_BN" value=${profitStatement.content.营业外.流出.营业外支出.本年累计数}>
                                              <input type="text" class="form-control" placeholder="上年累计数" name="YYW_YYWZC_LC_SN" value=${profitStatement.content.营业外.流出.营业外支出.上年累计数}>
                                          </div>
                                          
                                         
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="control-label col-lg-2" >税费：</label>
                                      <div class="col-lg-10">
                                      
                                            <div class="input-group m-bot15">                                            
                                              <label class="control-label">流出：</label>                                            
                                          </div> 
                                         <div class="input-group m-bot15">
                                              <span class="input-group-addon">所得税费用</span>
                                              <input type="text" class="form-control" placeholder="本年累计数" name="SF_SDSFY_LC_BN" value=${profitStatement.content.税费.流出.所得税费用.本年累计数}>
                                              <input type="text" class="form-control" placeholder="上年累计数" name="SF_SDSFY_LC_SN" value=${profitStatement.content.税费.流出.所得税费用.上年累计数}>
                                          </div>
                                        
                                  
                                  </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="control-label col-lg-2" >每股收益：</label>
                                      <div class="col-lg-10">
                                     
                                          <div class="input-group m-bot15">
                                              <span class="input-group-addon">基本每股收益</span>
                                              <input type="text" class="form-control" placeholder="本年累计数" name="MGSY_JBMGSY_BN" value=${profitStatement.content.每股收益.基本每股收益.本年累计数}>
                                              <input type="text" class="form-control" placeholder="上年累计数" name="MGSY_JBMGSY_SN" value=${profitStatement.content.每股收益.基本每股收益.上年累计数}>
                                          </div>
                                          <div class="input-group m-bot15">
                                              <span class="input-group-addon">稀释每股收益</span>
                                              <input type="text" class="form-control" placeholder="本年累计数" name="MGSY_XSMGSY_BN" value=${profitStatement.content.每股收益.稀释每股收益.本年累计数}>
                                              <input type="text" class="form-control" placeholder="上年累计数" name="MGSY_XSMGSY_SN" value=${profitStatement.content.每股收益.稀释每股收益.上年累计数}>
                                          </div>
                                                  
                                      </div>
                                  </div>
                                  </#list>                      
                                  <div class="col-lg-offset-2 col-lg-10">
                                       <button type="button" class="btn btn-info" id="update">修改</button>
                                       <button type="button" class="btn btn-info" id="submit">提交</button>                                       
                                       <span class="help-block">需要修改注册号或者时间，请选择提交.</span>
                                  </div>
									
                              </form>
                          </div>
                      </section>

                      
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

    <script src="js/jquery-ui-1.9.2.custom.min.js"></script>

    <!--custom switch-->
    <script src="js/bootstrap-switch.js"></script>
    <!--custom tagsinput-->
    <script src="js/jquery.tagsinput.js"></script>
    <!--custom checkbox & radio-->
    <script type="text/javascript" src="js/ga.js"></script>

    <script type="text/javascript" src="assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="assets/bootstrap-daterangepicker/date.js"></script>
    <script type="text/javascript" src="assets/bootstrap-daterangepicker/daterangepicker.js"></script>
    <script type="text/javascript" src="assets/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
    <script type="text/javascript" src="assets/ckeditor/ckeditor.js"></script>


  <!--common script for all pages-->
    <script src="js/common-scripts.js"></script>

  <!--script for this page-->
  <script src="js/form-component.js"></script>
	<script type="text/javascript">
	$("#update").click(function(){
		$.ajax({             
                type: "POST",
                url:"/managecenter/updateProfitStatement",
                data:$('#form').serialize(),// 你的formid
                async: false,
                error: function(request) {
                    alert("Connection error");
                },
                success: function(data) {
                   $.each(data, function(key, value) {
    				if(key=="body"){
    					alert(value);    					
    				}
    			});
                }
            });
	});
	
	$("#submit").click(function(){
		$.ajax({             
                type: "POST",
                url:"/managecenter/saveProfitStatement",
                data:$('#form').serialize(),// 你的formid
                async: false,
                error: function(request) {
                    alert("Connection error");
                },
                success: function(data) {
                   $.each(data, function(key, value) {
    				if(key=="body"){
    					alert(value);
    					window.location.href="/managecenter/profitStatement";
    				}
    			});
                }
            });
	});
	</script>
  </body>
</html>