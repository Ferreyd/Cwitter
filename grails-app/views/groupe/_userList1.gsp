<g:each in="${groupeInstance.users}">
    <li>
        ${it.username}
        <g:form controller="groupe" action="supprimerUser">
            <input type="hidden" name="userDelete" id="userDelete" value="${it.id}" />
            <g:submitButton name="supprimer utilisateur" class="btn btn-xs btn-danger"/>
        </g:form>
    </li>
</g:each>