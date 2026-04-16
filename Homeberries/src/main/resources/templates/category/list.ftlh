<#import "../layout/main.ftlh" as main>
<#import "../spring.ftl" as spring>
<@main.layout "Categories">

    <h2><@spring.message "categories.title"/></h2>

    <#if categories?size == 0>
        <p><@spring.message "categories.not_found"/></p>
    <#else>
        <div class="row">
            <#list categories as category>
                <div class="col-md-4 mb-3">
                    <div class="card">
                        <div class="card-body">
                            <h5>${category.name}</h5>
                            <a href="/products?categoryId=${category.id}" class="btn btn-primary"><@spring.message "categories.go"/></a>
                        </div>
                    </div>
                </div>
            </#list>
        </div>
    </#if>

</@main.layout>
