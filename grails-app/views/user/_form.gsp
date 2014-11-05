<%@ page import="cwitter.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
    <label for="username">
        <g:message code="user.username.label" default="Username"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="username" required="" value="${userInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
    <label for="password">
        <g:message code="user.password.label" default="Password"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="password" required="" value="${userInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'lastname', 'error')} ">
    <label for="lastname">
        <g:message code="user.lastname.label" default="Lastname"/>

    </label>
    <g:textField name="lastname" value="${userInstance?.lastname}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'firstname', 'error')} ">
    <label for="firstname">
        <g:message code="user.firstname.label" default="Firstname"/>

    </label>
    <g:textField name="firstname" value="${userInstance?.firstname}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} ">
    <label for="email">
        <g:message code="user.email.label" default="Email"/>

    </label>
    <g:textField name="email" value="${userInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'cweet', 'error')} ">
    <label for="cweet">
        <g:message code="user.cweet.label" default="Cweet"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${userInstance?.cweet ?}" var="c">
            <li><g:link controller="message" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="message" action="create"
                    params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'message.label', default: 'Message')])}</g:link>
        </li>
    </ul>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'follower', 'error')} ">
    <label for="follower">
        <g:message code="user.follower.label" default="Follower"/>

    </label>
    <g:select name="follower" from="${cwitter.User.list()}" multiple="multiple" optionKey="id" size="5"
              value="${userInstance?.follower*.id}" class="many-to-many"/>

</div>

