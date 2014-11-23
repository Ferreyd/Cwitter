<%@ page import="cwitter.Groupe" %>



<div class="fieldcontain ${hasErrors(bean: groupeInstance, field: 'nom', 'error')} required">
	<label for="nom">
		<g:message code="groupe.nom.label" default="Nom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nom" required="" value="${groupeInstance?.nom}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: groupeInstance, field: 'owner', 'error')} required">
	<label for="owner">
		<g:message code="groupe.owner.label" default="Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="owner" name="owner.id" from="${cwitter.User.list()}" optionKey="id" required="" value="${groupeInstance?.owner?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: groupeInstance, field: 'users', 'error')} ">
	<label for="users">
		<g:message code="groupe.users.label" default="Users" />
		
	</label>
	<g:select name="users" from="${cwitter.User.list()}" multiple="multiple" optionKey="id" size="5" value="${groupeInstance?.users*.id}" class="many-to-many"/>

</div>
