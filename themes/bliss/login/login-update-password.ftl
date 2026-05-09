<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password','password-confirm') displayInfo=false; section>
    <#if section = "form">
        <form id="kc-passwd-update-form" action="${url.loginAction}" method="post">
            <div class="bliss-input-group">
                <input id="password-new" name="password-new" type="password" placeholder=" " autocomplete="new-password" autofocus>
                <label for="password-new">${msg("passwordNew")}</label>
            </div>

            <div class="bliss-input-group">
                <input id="password-confirm" name="password-confirm" type="password" placeholder=" " autocomplete="new-password">
                <label for="password-confirm">${msg("passwordConfirm")}</label>
            </div>

            <input class="bliss-btn" type="submit" value="${msg("doSubmit")}">
        </form>
    </#if>
</@layout.registrationLayout>
