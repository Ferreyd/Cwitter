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
		<nav class="navbar navbar-default" role="navigation">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<a href="/Cwitter/user/acceuil/${session.user.id}"><asset:image src="cweeter.JPG" alt="MBDS"/></a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li>
							<g:form url="[resource:$user, controller:'cweet', action:'create']" method="POST">
								<g:actionSubmit class="btn btn-primary" controller="cweet" action="create" value="${message(code: 'default.button.addCweet.label', default: 'Ajout Cweet')}" />
							</g:form>
						</li>
						<li>
							<g:form url="[resource:$user, controller:'groupe', action:'create']" method="POST">
								<g:actionSubmit class="btn btn-default" controller="groupe" action="create" value="${message(code: 'default.button.groupe.label', default: 'Ajout Groupe')}" />
							</g:form>
						</li>
						<li>
							<g:form url="[resource:$user, controller:'groupe', action:'index']" method="POST">
								<g:actionSubmit class="btn btn-default" controller="groupe" action="index" value="${message(code: 'default.button.groupe.list', default: 'Liste Groupe')}" />
							</g:form>
						</li>

					</ul>


					<ul class="nav navbar-nav navbar-right">
						<div class="form-group">
							<g:form url="[resource:$user, controller:'user', action:'rechercher']" method="POST">
								<g:field name="rechercher" type="text" list="usersDL" placeholder="username" id="usersDataList" datalist="userDL"></g:field>
								<datalist id="usersDL">
									<g:each in="${cwitter.User.list()}">
										<option value="${it.username}" id="${it.id}">
									</g:each>
								</datalist>
								<g:actionSubmit class="btn btn-primary" value="${message(code: 'default.button.rechercher.label', default: 'Rechercher')}" />
							</g:form>
							<form class="navbar-form navbar-right">
								<div class="welcome">
									<h4>Welcome ${session.user.username}</h4>
								</div>
							</form>
						</div>
					</ul>
					<ul>
						<li>
							<g:form url="[resource: $user, controller: 'user', action:'logout']" method="POST">
								<g:actionSubmit class="btn btn-primary" controller="user" action="logout" value="${message(code: 'default.button.user.username', default: 'Logout')}"/>
							</g:form>
						</li>
					</ul>
				</div><!-- /.navbar-collapse -->
			</div><!-- /.container-fluid -->
		</nav>
		<div class="col-lg-12">
			<g:layoutBody/>
		</div>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>

	</g:if>
	<g:else>
		<g:if test="${flash.message}">
			<div class="message">${flash.message}</div>
		</g:if>


		<g:form style="width: 50%" url="[resource: userInstance, controller: 'user', action: 'authentification']" method="post" >
			<fieldset>
				<legend>Login</legend>
				<p>
					please login with your username and password.</br>
					Don't have an account ?
					<g:link controller="user" action="create"> Sign up now!</g:link>
				</p>
				<p>
					<label for="username">Username</label>
					<g:textField name="username"/>
				</p>
				<p>
					<label for="password">Password</label>
					<g:passwordField name="password"/>
				</p>
				<p class="button">
					<label></label>
					<g:submitButton class="save" type="submit" name="submitButton" value="Login"/>
				</p>
			</fieldset>
		</g:form>



	</g:else>
	</body>
</html>
