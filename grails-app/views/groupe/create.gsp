<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'groupe.label', default: 'Groupe')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="create-groupe" class="content scaffold-create" role="main">
			<h1>Creation d'un groupe</h1><br/>
			<g:form url="[resource:groupeInstance, action:'save']" >
				<fieldset class="form">
					<div class="fieldcontain ${hasErrors(bean: groupeInstance, field: 'nom', 'error')} required">
						<label for="nom">
							<g:message code="groupe.nom.label" default="Nom" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="nom" required="" placeholder="Nom du groupe" value="${groupeInstance?.nom}"/>

					</div>
                    <br/>
					<div class="fieldcontain ${hasErrors(bean: groupeInstance, field: 'users', 'error')} ">
						<label for="users">
							<g:message code="groupe.users.label" default="Users" />

						</label>
						<g:select  name="users" from="${cwitter.User.list()}" multiple="multiple" optionKey="id" optionValue="username" size="5" value="${groupeInstance?.users*.id}" class="many-to-many"/>
					</div>

				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save btn btn-primary btn-lg" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
