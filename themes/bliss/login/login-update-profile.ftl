<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email') displayInfo=false; section>
    <#if section = "form">
        <form id="kc-update-profile-form" action="${url.loginAction}" method="post">
            <div class="bliss-input-group">
                <input id="firstName" name="firstName" type="text" placeholder=" "
                       value="${(user.firstName!'')}" autofocus>
                <label for="firstName">${msg("firstName")}</label>
            </div>

            <div class="bliss-input-group">
                <input id="lastName" name="lastName" type="text" placeholder=" "
                       value="${(user.lastName!'')}">
                <label for="lastName">${msg("lastName")}</label>
            </div>

            <input type="hidden" name="email" value="${(user.email!'')}">

            <input class="bliss-btn" type="submit" value="${msg("doSubmit")}">
        </form>
    </#if>
</@layout.registrationLayout>
