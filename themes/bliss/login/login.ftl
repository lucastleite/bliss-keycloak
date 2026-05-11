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

            <div class="bliss-input-group bliss-password-group">
                <input id="password" name="password" type="password" autocomplete="current-password" placeholder=" ">
                <label for="password">${msg("password")}</label>
                <button type="button" class="bliss-toggle-password" aria-label="Toggle password visibility" onclick="togglePassword()">
                    <svg class="eye-open" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                        <circle cx="12" cy="12" r="3"></circle>
                    </svg>
                    <svg class="eye-closed" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="display:none">
                        <path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94"></path>
                        <path d="M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19"></path>
                        <line x1="1" y1="1" x2="23" y2="23"></line>
                    </svg>
                </button>
            </div>
            <script>
                function togglePassword() {
                    var input = document.getElementById('password');
                    var btn = document.querySelector('.bliss-toggle-password');
                    var eyeOpen = btn.querySelector('.eye-open');
                    var eyeClosed = btn.querySelector('.eye-closed');
                    if (input.type === 'password') {
                        input.type = 'text';
                        eyeOpen.style.display = 'none';
                        eyeClosed.style.display = 'block';
                    } else {
                        input.type = 'password';
                        eyeOpen.style.display = 'block';
                        eyeClosed.style.display = 'none';
                    }
                }
            </script>

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
