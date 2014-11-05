<%@ page import="cwitter.Cweet" %>



<div class="fieldcontain ${hasErrors(bean: cweetInstance, field: 'message', 'error')} required">
	<label for="message">
		<g:message code="cweet.message.label" default="Message" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="message" maxlength="140" required="" value="${cweetInstance?.message}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cweetInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="cweet.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${cweetInstance?.date}"  />

</div>

