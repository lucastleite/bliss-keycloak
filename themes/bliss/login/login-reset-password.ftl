<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
    <#if section = "form">
        <form id="kc-reset-password-form" action="${url.loginAction}" method="post">
            <div class="bliss-input-group">
                <input id="username" name="username" type="email" autocomplete="email" placeholder=" " autofocus>
                <label for="username">${msg("email")}</label>
            </div>

            <input class="bliss-btn" type="submit" value="${msg("doSubmit")}">

            <div class="bliss-links">
                <a href="${url.loginUrl}">${msg("backToLogin")}</a>
            </div>
        </form>
    <#elseif section = "info">
        ${msg("emailInstruction")}
    </#if>
</@layout.registrationLayout>
