
<%@ page import="cwitter.Groupe" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'groupe.label', default: 'Groupe')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
    <h1>Liste des groupes</h1>
		<div id="list-groupe" class="content scaffold-list" role="main">
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nom" title="${message(code: 'groupe.nom.label', default: 'Nom')}" />
					
						<th><g:message code="groupe.owner.label" default="Owner" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${groupeInstanceList}" status="i" var="groupeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${groupeInstance.id}">${fieldValue(bean: groupeInstance, field: "nom")}</g:link></td>
					
						<td>${groupeInstance.owner.username}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${groupeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
