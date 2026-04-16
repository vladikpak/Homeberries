<#import "../layout/main.ftlh" as main>
<#import "../spring.ftl" as spring>
<@main.layout "Products">

    <div class="row">
        <div class="col-md-3">
            <div class="card">
                <div class="card-header"><@spring.message "filters.title"/></div>
                <div class="card-body">
                    <form action="/products" method="get">
                        <div class="mb-3">
                            <label><@spring.message "filters.name"/></label>
                            <input type="text" name="name" class="form-control" value="${filterName!''}">
                        </div>
                        <div class="mb-3">
                            <label><@spring.message "filters.category"/></label>
                            <select name="categoryId" class="form-control">
                                <option value=""><@spring.message "filters.all"/></option>

                                <#list categories as cat>
                                    <option value="${cat.id}" ${((filterCategory!-1) == cat.id)?then('selected', '')}>
                                        ${cat.name}
                                    </option>
                                </#list>

                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary"><@spring.message "common.apply"/></button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-9">
            <div class="row">

                <#if products?size == 0>
                    <div class="col-12">
                        <p><@spring.message "product.not_found"/></p>
                    </div>
                <#else>

                    <#list products as product>
                        <div class="col-md-4 mb-4">
                            <div class="card h-100">

                                <#if product.imageUrl??>
                                    <img src="${product.imageUrl}" class="card-img-top" style="height: 150px; object-fit: cover;">
                                <#else>
                                    <img src="https://via.placeholder.com/300" class="card-img-top">
                                </#if>

                                <div class="card-body">
                                    <h5 class="card-title">${product.name}</h5>
                                    <p class="card-text"><@spring.message "product.price"/>: ${product.price} сом</p>

                                    <a href="/products/${product.id}" class="btn btn-primary btn-sm"><@spring.message "product.details"/></a>
                                    <form action="/cart/add/${product.id}" method="post" style="display:inline;">
                                        <@main.csrf />
                                        <input type="hidden" name="quantity" value="1">
                                        <button type="submit" class="btn btn-outline-success btn-sm"><@spring.message "product.add_to_cart"/></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </#list>
                </#if>

            </div>
        </div>
    </div>

</@main.layout>

