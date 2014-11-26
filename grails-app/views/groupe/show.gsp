
<%@ page import="cwitter.Groupe" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'groupe.label', default: 'Groupe')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-groupe" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-groupe" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list groupe">
			
				<g:if test="${groupeInstance?.nom}">
				<li class="fieldcontain">
					<span id="nom-label" class="property-label"><g:message code="groupe.nom.label" default="Nom" /></span>
					
						<span class="property-value" aria-labelledby="nom-label"><g:fieldValue bean="${groupeInstance}" field="nom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${groupeInstance?.owner}">
				<li class="fieldcontain">
					<span id="owner-label" class="property-label"><g:message code="groupe.owner.label" default="Owner" /></span>
					
						<span class="property-value" aria-labelledby="owner-label"><g:link controller="user" action="show" id="${groupeInstance?.owner?.id}">${groupeInstance?.owner?.username.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${groupeInstance?.users}">
					<div class="col-lg-4">
						<li class="fieldcontain">
							<span id="users-label" class="property-label"><g:message code="groupe.members" default="Users" /></span>

							<g:each in="${groupeInstance.users}" var="u">
								<span class="property-value" aria-labelledby="users-label"><g:link controller="user" action="show" id="${u.id}">${u?.username.encodeAsHTML()}</g:link></span>
							</g:each>

						</li>
					</div>
					<div class="col-lg-4">
						<li class="fieldcontain">
							<span id="users-label" class="property-label"><g:message code="groupe.members" default="Users" /></span>

							<g:each in="${groupeInstance.users}" var="u">
								<span class="property-value" aria-labelledby="users-label"><g:link controller="user" action="show" id="${u.id}">${u?.username.encodeAsHTML()}</g:link></span>
							</g:each>

						</li>
					</div>

				</g:if>

			</ol>
			<g:form url="[resource:groupeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${groupeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
