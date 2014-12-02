<%@ page import="cwitter.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'groupe.label', default: 'Groupe')}" />
		<g:javascript library="prototype" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<g:javascript>
	function updateUsername(e) {
		// The response comes back as a bunch-o-JSON
		var users = eval("(" + e.responseText + ")")	// evaluate JSON

		if (cities) {
			var rselect = document.getElementById('users')

			// Clear all previous options
			var l = rselect.length

			while (l > 0) {
				l--
				rselect.remove(l)
			}

			// Rebuild the select
			for (var i=0; i < users.length; i++) {
				var user = users[i]
				var opt = document.createElement('option');
				opt.text = user.username
				opt.value = user.id
			  	try {
			    	rselect.add(opt, null) // standards compliant; doesn't work in IE
			  	}
		  		catch(ex) {
		    		rselect.add(opt) // IE only
		  		}
			}
		}
	}


	// This is called when the page loads to initialize city
	var zselect = document.getElementById('users');
	var zopt = zselect.options[zselect.selectedIndex]
	${remoteFunction(controller:"groupe", action:"searchWSUsername", params:"'id=' + zopt.value", onComplete:"updateUsername(e)")}

		</g:javascript>
	</head>
	<body>
		<a href="#create-groupe" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-groupe" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
			<g:form url="[resource:groupeInstance, action:'save']" >

				<label for="nom">
					<g:message code="groupe.nom.label" default="Nom du groupe" />
					<span class="required-indicator">*</span>
				</label>
				<g:textField name="nom" required="" value="${groupeInstance?.nom}"/>
				<g:select name="searchUser" from="${User.list()} value="/>
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</g:form>
		</div>
	</body>
</html>
