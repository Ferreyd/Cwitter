<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <g:set var="user" value="${cwitter.User.get(params.id)}"/>
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<g:if test="${user != null}">
    <div class="col-lg-12">
        <div class="col-lg-8">
                Utilisateur : ${user.username} <br/>




        </div>
        <div class="col-lg-4">

        </div>


    </div>
    <div class="col-lg-12 cweets">
        <h1>
            Vos CWeet
        </h1>

        <g:each in="${user.cweets}" var="cweet">
            <div class="col-lg-12 cweet">
                <p>
                    ${cweet.message}<br/>
                    ${cweet.date} par ${cweet.user.username}
            <g:form url="[resource:cweet, controller:'cweet', action:'delete']" method="DELETE">
                    <g:actionSubmit class="btn btn-danger" controller="cweet" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </g:form>
                </p>
            </div>
        </g:each>
    </div>


</g:if>
<g:else>
    <h1>
        Il n'y a pas d'utilisateur avec cet identifiant. <br/>
        Cliquez <g:link action="acceuil" id="${session.user.id}">sur ce lien</g:link> pour revenir à votre compte.
    </h1>
</g:else>
</body>
</html>