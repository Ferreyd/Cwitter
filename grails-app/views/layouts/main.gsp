<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<g:layoutHead/>
	</head>
	<body>
	<g:if test="${session["connecte"].equals("OK")}">
		<div id="grailsLogo" role="banner"><a href="http://grails.org"><asset:image src="grails_logo.png" alt="Grails"/></a></div>
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>

	</g:if>
	<g:else>
		<g:if test="${flash.message}">
			<div class="message">${flash.message}</div>
		</g:if>

		<g:form controller="user" action="authentification" method="post" >
			<div class="dialog">
				<table>
					<tbody>
					<tr class="prop">
						<td class="name">
							<label for="username">Login:</label>
						</td>
						<td>
							<input type="text" id="username" name="username"/>
						</td>
					</tr>

					<tr class="prop">
						<td class="name">
							<label for="password">Password:</label>
						</td>
						<td>
							<input type="password" id="password" name="password"/>
						</td>
					</tr>
					</tbody>
				</table>
			</div>
			<div class="buttons">
				<span class="button">
					<input class="save" type="submit" value="Login" />
				</span>
			</div>
		</g:form>
	</g:else>
	</body>
</html>
