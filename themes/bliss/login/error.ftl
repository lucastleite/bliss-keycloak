<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=true displayInfo=false; section>
    <#if section = "form">
        <div class="bliss-links">
            <#if client?? && client.baseUrl?has_content>
                <a href="${client.baseUrl}">${msg("backToApplication")}</a>
            </#if>
        </div>
    </#if>
</@layout.registrationLayout>
