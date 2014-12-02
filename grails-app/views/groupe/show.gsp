
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
	<div class="col col-lg-12">
		<div class="col-lg-3">
			<div class="col-lg-3">
				<div class="groupeInfo">
					<g:message code="groupe.nom.label"/> : ${groupeInstance.nom} <br/>
					<g:message code="groupe.owner.label"/> : <g:link controller="user" action="show" id="${groupeInstance.owner.id}">${groupeInstance.owner.username}</g:link> <br/>


					<g:message code="groupe.members"/> :

					<g:each in="${groupeInstance.users}" var="user">
						<li> <g:link controller="user" action="show" id="${user.id}">${user.username}</g:link></li>
					</g:each>
				</div>
			</div>
		</div>
		<div class="col-lg-6">
			<h4><span class="label label-primary"> Cweets in this groupe:</span></h4>
				<g:each in="${groupeInstance.users}" status="i" var="user">
					<g:each in="${user.cweets}" var="cweet">
						<div id="groupeMessages">
							${cweet.message}<br/>
							<div id="messageUser&Date">
								par ${cweet.user.username} le ${cweet.date} </br>
							</div>
						</div>
					</g:each>
				</g:each>

		</div>
	</div>
	<div class="col-lg-12">
	<g:form url="[resource:groupeInstance, action:'delete']" method="DELETE">
		<fieldset class="buttons">
			<g:link class="edit" action="edit" resource="${groupeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
			<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
		</fieldset>
	</g:form>
	</div>
</body>
</html>
