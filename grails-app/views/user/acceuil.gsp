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

                <div class="panel">

                    <div><h2><span class="label label-primary">${user.username}'s personal information:</span></h2></div>

                    <table class="table">
                        <td>Nom: ${user.lastname}</td>
                        <td>Prenom: ${user.firstname}</td>
                        <td>E-mail: ${user.email}</td>
                    </table>
                </div>
            </g:form>
        </div>

        <div class="col-lg-4">
            <!--button class="btn btn-primary" type="button">Your Cweets:<span class="badge"></span></button-->
            <h2><span class="label label-primary"> Your Cweets: </span></h2>

            <g:each in="${user.cweets}" var="cweet">
                <g:each in="${cweet}" status="i" var="cweetInstance"><br/>
                    <td> ${cweetInstance.message}</td>
                    <td><g:formatDate date="${cweetInstance.date}"/></td>
                </g:each>
            </g:each>
        </div>

        <div class="col-lg-4">
            <table>
                <tr>
                    <td><h2><span class="label label-primary">Following Groupes</span></h2></td>
                </tr>
                <tr>
                    <td><g:each in="${user.groupes}" var="groupeInstance">${groupeInstance.nom}</g:each></td>
                </tr>
                <tr>
                    <td><h4><span class="label label-primary"> Cweets in groupes That you follows:</span></h4></td>
                </tr>
                <tr>
                    <td><g:each in="${user.groupes}" var="groupe">
                            <g:each in="${groupe.users}" status="i" var="user">
                                <g:each in="${user.cweets}" var="cweet">
                                    <div id="groupeMessages">
                                        ${cweet.message}<br/>
                                        <div id="messageUser&Date">
                                            par ${cweet.user.username} le ${cweet.date} </br>
                                        </div>
                                    </div>
                                </g:each>
                            </g:each>
                        </g:each>
                    </td>
                </tr>
            </table>
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