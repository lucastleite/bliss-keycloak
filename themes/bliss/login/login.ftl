<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=true displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "form">
        <form id="kc-form-login" action="${url.loginAction}" method="post">
            <div class="bliss-input-group">
                <input id="username" name="username" type="email" autocomplete="email" placeholder=" "
                       value="${(login.username!'')}"
                       autofocus>
                <label for="username">${msg("email")}</label>
            </div>

            <div class="bliss-input-group">
                <input id="password" name="password" type="password" autocomplete="current-password" placeholder=" ">
                <label for="password">${msg("password")}</label>
            </div>

            <#if realm.rememberMe && !usernameEditDisabled??>
                <div class="bliss-remember">
                    <input id="rememberMe" name="rememberMe" type="checkbox"
                           <#if login.rememberMe??>checked</#if>>
                    <label for="rememberMe">${msg("rememberMe")}</label>
                </div>
            </#if>

            <button class="bliss-btn" type="submit">${msg("doLogIn")}</button>

            <div class="bliss-links">
                <#if realm.resetPasswordAllowed>
                    <a href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
                </#if>
            </div>
        </form>
    <#elseif section = "info">
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            ${msg("noAccount")} <a href="${url.registrationUrl}">${msg("doRegister")}</a>
        </#if>
    </#if>
</@layout.registrationLayout>
