<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false>
<!DOCTYPE html>
<html lang="<#if locale?? && locale.currentLanguageTag??>${locale.currentLanguageTag}<#else>en</#if>">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.png">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${url.resourcesPath}/css/bliss.css">
</head>
<body>
    <div class="bliss-container">
        <div class="bliss-card">
            <div class="bliss-logo">
                <img src="${url.resourcesPath}/img/logo.png" alt="Bliss">
            </div>

            <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                <div class="bliss-alert bliss-alert-${message.type}">
                    ${kcSanitize(message.summary)?no_esc}
                </div>
            </#if>

            <#nested "form">

            <#if displayInfo>
                <div class="bliss-info">
                    <#nested "info">
                </div>
            </#if>

            <#if locale?? && realm.internationalizationEnabled && locale.supported?size gt 1>
                <div class="bliss-locale">
                    <#list locale.supported as l>
                        <a href="${l.url}" <#if l.label == locale.current>class="active"</#if>>${l.label}</a>
                    </#list>
                </div>
            </#if>
        </div>
    </div>
</body>
</html>
</#macro>
