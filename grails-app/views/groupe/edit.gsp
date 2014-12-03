<%@ page import="cwitter.Groupe" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'groupe.label', default: 'Groupe')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
<div id="edit-groupe" class="content scaffold-edit" role="main">
	<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
	<g:hasErrors bean="${groupeInstance}">
		<ul class="errors" role="alert">
			<g:eachError bean="${groupeInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
			</g:eachError>
		</ul>
	</g:hasErrors>
	<g:form url="[resource:groupeInstance, action:'update']" method="PUT" >
		<g:hiddenField name="version" value="${groupeInstance?.version}" />
		<fieldset class="form">
			<div class="fieldcontain ${hasErrors(bean: groupeInstance, field: 'nom', 'error')} required">
				<label for="nom">
					<g:message code="groupe.nom.label" default="Nom" />
					<span class="required-indicator">*</span>
				</label>
				<g:textField name="nom" required="" value="${groupeInstance?.nom}"/>

			</div>

			<div class="fieldcontain ${hasErrors(bean: groupeInstance, field: 'users', 'error')} ">
				<label for="users">
					<g:message code="groupe.users.label" default="Users" />

				</label>
				<g:select name="users" from="${cwitter.User.list()}" multiple="multiple" optionKey="id" optionValue="username" size="5" value="${groupeInstance?.users*.id}" class="many-to-many"/>
			</div>

		</fieldset>


	</g:form>
	<fieldset class="buttons">
		<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
	</fieldset>

	<g:formRemote url="[action: 'usersAdd']" update="updateMe" name="usersAdd">
		<g:field name="userDataList" type="text" list="usersDL"  id="usersDataList" datalist="userDL"></g:field>
		<g:field name="groupeInstance" type="hidden" id="groupeInstance" value="${groupeInstance.nom}"></g:field>
		<datalist id="usersDL">
			<g:each in="${cwitter.User.list()}">
				<option value="${it.username}" id="${it.id}">
			</g:each>
		</datalist>
		<g:submitButton name="Submit" />
	</g:formRemote>
	<h3>Liste des users ajoutees : </h3><br/>

<div id="updateMe">
	<g:render id="" template="userList1" collection="${users}"/>
</div>

</div>
</body>
</html>
