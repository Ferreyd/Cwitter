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

        <div class="col-lg-10">

            <g:form url="[resource: $user, controller: 'user', action: 'show']" method="GET">
                <h2>${user.username}'s personal information:</h2>

                <td> Nom: ${user.lastname} </td><br/>
                <td> Prenom: ${user.firstname} </td><br/>
                <td> e-mail: ${user.email} </td><br/>
            </g:form>
        </div>

        <div class="col-lg-10">
                <h2>${user.username}'s Cweets:</h2>

                <g:each in="${user.cweets}" var="cweet">
                        <g:each in="${cweet}" status="i" var="cweetInstance"><br/>
                                    <td> ${cweetInstance.message}</td>
                                    <td><g:formatDate date="${cweetInstance.date}"/></td>
                        </g:each>
                </g:each>

                <div class="col-lg-12">
                <h4>Total number of Cweets you posted: </h4>
                    <p> ${user.cweets.asList().size()} </p>
                </div>
        </div>

        <div class="col-lg-10">
            <h2> you follow ${user.groupes.asList().size()} groupe </h2>

        </div>

        <div class="col-lg-10">
                <h2> Cweets in groupes That ${user.username} follows:</h2>

                    <g:each in="${user.groupes}" var="groupe">
                        <div class="col-lg-12 cweet">
                            <p>
                                ${user.cweets.message}<br/>
                            </p>
                        </div>
                    </g:each>
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