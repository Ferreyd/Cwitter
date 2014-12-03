
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
		<div class="col-lg-4">
			<div class="col-lg-3">
				<div class="groupeInfo">
					<h3><g:message code="groupe.nom.label"/> : ${groupeInstance.nom} <br/></h3>
					<h4><g:message code="groupe.owner.label"/> : <g:link controller="user" action="show" id="${groupeInstance.owner.id}">${groupeInstance.owner.username}</g:link> <br/></h4>

					<g:message code="groupe.members"/> :

					<g:each in="${groupeInstance.users}" var="user">
						<li> <g:link controller="user" action="show" id="${user.id}">${user.username}</g:link></li>
					</g:each>
				</div>
                <g:form action="follow">
                    <input type="hidden" name="idGroupe" value="${groupeInstance.id}"/>
                    <g:actionSubmit action="follow" name="Follow" class="btn btn-primary btn-lg" value="Follow"/>
                </g:form>
                <br/>
                <g:form action="unfollow">
                    <input type="hidden" name="idGroupe" value="${groupeInstance.id}"/>
                    <g:actionSubmit action="unfollow" name="Unfollow" class="btn btn-danger btn-lg" value="Unfollow"/>
                </g:form>

			</div>
		</div>

		<div class="col-lg-6">
            <h2>Liste des cweets</h2>
            <table class="table table-striped table-bordered">
                <g:sortableColumn property="user" defaultOrder="desc" title="user"/>
                <g:sortableColumn property="cweet" defaultOrder="desc" title="cweet"/>
                <g:each in="${groupeInstance.users}" status="i" var="user">
                    <g:each in="${user.cweets}" var="cweet">
                        <div id="groupeMessages">
                            <tr>
                                <td>
                                    ${cweet.user.username}
                                </td>
                                <td>
                                    ${cweet.message}<br/>
                                </td>
                            </tr>
                        </div>
                    </g:each>
                </g:each>
            </table>

		</div>
	</div>
	<div class="col-lg-12">
	<g:form url="[resource:groupeInstance, action:'delete']" method="DELETE">
		<fieldset class="buttons">
			<g:link class="edit btn btn-info" action="edit" resource="${groupeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
			<g:actionSubmit class="delete btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
		</fieldset>
	</g:form>
	</div>
</body>
</html>
