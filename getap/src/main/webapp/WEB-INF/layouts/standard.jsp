<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html 
	PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<% String userAgent = request.getHeader("user-agent"); %>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" lang="fr">
	<head>
	
		<title>
			<tiles:getAsString name="title" />
		</title>
		<style type="text/css" media="screen">
			@import url("<c:url value="/styles/css-framework/typo.css" />");
			@import url("<c:url value="/styles/css-framework/menu.css" />");
			@import url("<c:url value="/styles/css-framework/demos.css" />");
			@import url("<c:url value="/styles/odt.css" />");
			
			/* TODO : voir le resultat avec Chrome sous ubuntu...  */
			
			<% if(userAgent.indexOf("Firefox") != -1) { %>
				@import url("<c:url value="/styles/standard.css" />");
			<% } else if(userAgent.indexOf("Chrome") != -1) { %>
				@import url("<c:url value="/styles/standardChrome.css" />");
			<% } %>
		</style>
		<link rel="stylesheet" href="../../styles/css-framework/jquery-ui.css" type="text/css" media="all" />
		<link rel="stylesheet" href="../../styles/css-framework/jquery-ui-1.9.1.custom.css" type="text/css" media="all" />
			
		<script type="text/javascript" src="../../styles/javascript/prefix.js"></script>
		<script type="text/javascript" src="../../styles/javascript/fonctions.js"></script>	
        <script type="text/javascript" src="../../styles/javascript/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="../../styles/javascript/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="../../styles/javascript/jquery-ui.verymin.js"></script>
		<!-- <script src="http://code.jquery.com/ui/1.8.20/jquery-ui.min.js" type="text/javascript"></script>-->		
		<script>
		$(document).ready(function() {
			$('.dataTable').dataTable( {
				"oLanguage": {
					"sEmptyTable": "Aucune donnée correspondante",
					"sLoadingRecords": "Traitement en cour...",
					"sProcessing": "Traitement en cour...",
					"sZeroRecords": "Aucune donnée correspondante",
					"sInfo": "Affiche de _START_ à _END_ sur _TOTAL_ éléments",
					"sInfoEmpty": "Aucun élément",
					"sInfoFiltered": "",
					"sSearch": "<img src='../../images/search.png' width='24' height='24'>",
					"sLengthMenu": 'Affiche <select>'+
					 	'<option value="5">5</option>'+
					 	'<option value="10">10</option>'+
					 	'<option value="15">15</option>'+
					 	'<option value="20">20</option>'+
					 	'<option value="25">25</option>'+
					 	'<option value="-1">Tous</option>'+
					 	'</select> éléments par page',
					"oPaginate": {
						"sFirst": "<<",
						"sLast": ">>",
						"sNext": ">",
						"sPrevious": "<"
					}
				},
				"aaSorting": [  ],
				"sPaginationType": "full_numbers"
			} );
		} );
		</script>
		
     	<script>
  			/* $(document).ready(function() {
   				$("#accordion").accordion({ collapsible: true, activate: false, autoHeight:false});
  			}); */
  			
  			$(function(){
  			// Accordion
  			$("#accordion").accordion({autoHeight: false, header: "h3",  event: "click", collapsible : "true", active:"false"});
  			$("#accordion2").accordion({autoHeight: false, header: "h3",  event: "click", collapsible : "true", active:"false"});
  			$("#accordion3").accordion({autoHeight: false, header: "h3",  event: "click", collapsible : "true", active:"false"});
  			});
  		</script>
  		
        <script>
		  $(document).ready(function() {
			$("#datepicker" ).datepicker({dateFormat: "yy-mm-dd", 
		    	                          monthNames: ["Janvier","Février","Mars","Avril","Mai","Juin","Juillet","Août","Septembre","Octobre","Novembre","Décembre"],
		    	                          dayNames: ["Dimanche", "Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi"],
		    	                          dayNamesMin: ["Di", "Lu", "Ma", "Me", "Je", "Ve", "Sa"],
		    	                          beforeShow: function (textbox, instance) {
		    	                              instance.dpDiv.css({
		    	                                      marginTop: (-textbox.offsetHeight-47) + 'px',
		    	                                      marginLeft: (textbox.offsetWidth+88) + 'px'
		    	                              });
		    	                          }
		    });
			$("#datepicker").datepicker( "option", "showAnim", 'bounce');
		  }); 
		</script>
		
	</head>
	
	<body onload="testRole()">
	
	<div id="banniere">
		<c:if test="${empty user.role}">
			<a href="/getap/app/login/index"><img src="<c:url value="/images/logos/logoGetapV5.png"/>" width="102px"
		height="34px"/></a>
		</c:if>
		<c:if test="${not empty user.role}">
			<a href="/getap/app/${user.role}/index"><img src="<c:url value="/images/logos/logoGetapV5.png"/>" width="102px"
		height="34px"/></a>
		</c:if>
	</div>
	
	<tiles:insertAttribute name="navigation" />

	<div id="page">
        
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<!-- end header -->
		<div>
			<tiles:insertAttribute name="body" />
		</div>
		<!-- end content -->
	</div>
	<div id="footer">
		<tiles:insertAttribute name="footer" />
	</div>
		<!-- end footer -->
	
	<!-- end page -->
	</body>
</html>
