
<%@ page import="cwitter.Groupe" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'groupe.label', default: 'Groupe')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-groupe" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="col col-lg-12">
				<div class="nomGroupe">
					<g:message code="groupe.nom.label"/> : ${groupeInstance.nom}
				</div>
			</div>

			<div class="col col-lg-12">
				<div class="proprioGroupe">
					<g:message code="groupe.owner.label"/> : <g:link controller="user" action="show" id="${groupeInstance.owner.id}">${groupeInstance.owner.username}</g:link>
				</div>
			</div>

			<div class="col col-lg-12">
				<div class="listUser">
					<g:message code="groupe.members"/> :

					<g:each in="${groupeInstance.users}" var="user">
						<li> <g:link controller="user" action="show" id="${user.id}">${user.username}</g:link></li>
					</g:each>
				</div>
			</div>

			<g:form url="[resource:groupeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${groupeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
