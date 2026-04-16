<#import "../layout/main.ftlh" as main>
<#import "../spring.ftl" as spring>
<@main.layout "${product.name}">

    <div class="row">
        <div class="col-md-6">
            <#if product.imageUrl??>
                <img src="${product.imageUrl}" class="img-fluid rounded" alt="${product.name}">
            <#else>
                <img src="https://via.placeholder.com/500" class="img-fluid rounded" alt="<@spring.message "product.not_found"/>">
            </#if>
        </div>

        <div class="col-md-6">
            <h1>${product.name}</h1>
            <p class="lead">${product.description!""}</p>
            <h3 class="text-primary"><@spring.message "product.price"/>: ${product.price} сом</h3>
            <a href="/products" class="btn btn-secondary btn-lg ms-2"><@spring.message "common.back"/></a>
        </div>
    </div>

</@main.layout>
