
<%@ page import="cwitter.Cweet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cweet.label', default: 'Cweet')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cweet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cweet" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cweet">
			
				<g:if test="${cweetInstance?.message}">
				<li class="fieldcontain">
					<span id="message-label" class="property-label"><g:message code="cweet.message.label" default="Message" /></span>
					
						<span class="property-value" aria-labelledby="message-label"><g:fieldValue bean="${cweetInstance}" field="message"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cweetInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="cweet.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${cweetInstance?.date}" /></span>
					
				</li>
				</g:if>
			
			</ol>

		</div>
	</body>
</html>
