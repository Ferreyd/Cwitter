<%@ page import="cwitter.Groupe" %>



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

<div class="fieldcontain ${hasErrors(bean: groupeInstance, field: 'users', 'error')} ">

	<label for="usersDataList"><g:message code="groupe.usersDataList.label" default="users datalist"/> :</label>
	<!--<input list="usersDL" type="text" id="usersDataList"> -->
	<g:field name="userDataList" type="text" list="usersDL"  id="usersDataList" datalist="userDL"></g:field>
	<datalist id="usersDL">
		<g:each in="${cwitter.User.list()}">
			<option value="${it.username}" id="${it.id}">
		</g:each>
	</datalist>


</div>


