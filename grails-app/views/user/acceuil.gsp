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
    <div class="row">
        <div class="col-lg-3">
            <g:form url="[resource: $user, controller: 'user', action: 'show']" method="GET">

                <div class="panel panel-success">

                    <div class="panel-heading">${user.username}'s personal information:</div>

                    <table class="table">
                        <td>Nom: ${user.lastname}</td>
                        <td>Prenom: ${user.firstname}</td>
                        <td>E-mail: ${user.email}</td>
                    </table>
                </div>
            </g:form>
        </div>

        <div class="col-lg-5">
            <button class="btn btn-primary" type="button">Your Cweets:<span class="badge"></span></button>

            <g:each in="${user.cweets}" var="cweet">
                <g:each in="${cweet}" status="i" var="cweetInstance"><br/>
                    <td> ${cweetInstance.message}</td>
                    <td><g:formatDate date="${cweetInstance.date}"/></td>
                </g:each>
            </g:each>
        </div>

        <div class="col-lg-4">
            <div class="col-lg-6">
                <a href="#">Following Groupes
                    <span class="badge">
                        <g:each in="${user.groupes}" var="groupeInstance">
                            <td> ${groupeInstance.nom}</td>
                        </g:each>
                    </span>
                </a>
            </div>
            <div class="col-lg-3">
                <button class="btn btn-primary" type="button"> Cweets in groupes That you follows:
                    <span class="badge"></span>
                </button>

                <g:each in="${user.groupes}" var="groupe">
                    <div class="col-lg-3">
                        <p>${groupe.getUsers()}<br/></p>
                    </div>
                </g:each>
            </div>
        </div>

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