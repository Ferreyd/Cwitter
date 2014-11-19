<%--
  Created by IntelliJ IDEA.
  User: Nicolas
  Date: 19/11/2014
  Time: 10:54
--%>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Recherche</title>
</head>

<body>
<h1>
    Recherche :
</h1>
<g:if test="${userRecherche.equals(message(code: 'default.recherche.testVide', default: 'Les critères de votre recherche n\'ont rien trouvé'))}">
    <h2>
        echec : ${userRecherche}
    </h2>

</g:if>
<g:else>
    <g:each in="${userRecherche}" var="user">
        <div class="col-lg-12 cweet">
            <p>
                ${user.username}<br/>
            </p>
        </div>
    </g:each>
</g:else>

</body>
</html>