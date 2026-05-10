<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayMessage=true; section>
    <#if section = "form">
        <form id="kc-reset-password-form" action="${url.loginAction}" method="post">
            <div class="bliss-input-group">
                <input id="username" name="username" type="email" autocomplete="email" placeholder=" " autofocus>
                <label for="username">${msg("email")}</label>
            </div>

            <button class="bliss-btn" type="submit">${msg("doLogIn")}</button>

            <div class="bliss-links">
                <a href="${url.loginUrl}">${msg("backToLogin")}</a>
            </div>
        </form>
    <#elseif section = "info">
        ${msg("emailInstruction")}
    </#if>
</@layout.registrationLayout>
