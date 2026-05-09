<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=true displayInfo=false; section>
    <#if section = "form">
        <#if requiredActions??>
            <#list requiredActions>
                <div class="bliss-info">
                    <#items as reqActionItem>${msg("requiredAction.${reqActionItem}")}<#sep>, </#items>
                </div>
            </#list>
        </#if>

        <div class="bliss-links">
            <#if skipLink??>
            <#else>
                <#if pageRedirectUri?has_content>
                    <a href="${pageRedirectUri}">${kcSanitize(msg("backToApplication"))?no_esc}</a>
                <#elseif actionUri?has_content>
                    <a href="${actionUri}">${kcSanitize(msg("proceedWithAction"))?no_esc}</a>
                <#elseif (client.baseUrl)?has_content>
                    <a href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a>
                </#if>
            </#if>
        </div>
    </#if>
</@layout.registrationLayout>
