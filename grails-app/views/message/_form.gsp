<%@ page import="cwitter.Message" %>



<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'message', 'error')} required">
    <label for="message">
        <g:message code="message.message.label" default="Message"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="message" maxlength="140" required="" value="${messageInstance?.message}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'author', 'error')} required">
    <label for="author">
        <g:message code="message.author.label" default="Author"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="author" name="author.id" from="${cwitter.User.list()}" optionKey="id" required=""
              value="${messageInstance?.author?.id}" class="many-to-one"/>

</div>

