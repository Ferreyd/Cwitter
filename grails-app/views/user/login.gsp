
<%@ page import="cwitter.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
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
</body>
</html>