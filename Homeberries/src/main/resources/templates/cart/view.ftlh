<#import "../layout/main.ftlh" as main>
<#import "../spring.ftl" as spring>
<@main.layout "Cart">

    <h2><@spring.message "cart.title"/></h2>

    <#if cart.items?size == 0>
        <div class="alert alert-info">
            <p><@spring.message "cart.empty"/></p>
            <a href="/products" class="btn btn-primary"><@spring.message "order.continue"/></a>
        </div>
    <#else>
        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th><@spring.message "filters.name"/></th>
                    <th><@spring.message "product.price"/></th>
                    <th><@spring.message "product.quantity"/></th>
                    <th><@spring.message "cart.total"/></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <#list cart.items as item>
                    <tr>
                        <td>${item.productName}</td>
                        <td>${item.productPrice} ₽</td>
                        <td>
                            <form action="/cart/update/${item.productId}" method="post" style="display:inline;">
                                <@main.csrf />
                                <input type="number" name="quantity" value="${item.quantity}" min="1" style="width:70px;">
                                <button type="submit" class="btn btn-sm btn-primary"><@spring.message "cart.update"/></button>
                            </form>
                        </td>
                        <td>${item.productPrice * item.quantity} ₽</td>
                        <td>
                            <form action="/cart/remove/${item.productId}" method="post" style="display:inline;">
                                <@main.csrf />
                                <button type="submit" class="btn btn-sm btn-danger"><@spring.message "cart.remove"/></button>
                            </form>
                        </td>
                    </tr>
                </#list>
                </tbody>
                <tfoot>
                <tr class="table-dark">
                    <td colspan="3" class="text-end"><strong><@spring.message "cart.total"/>:</strong></td>
                    <td><strong>${totalAmount} ₽</strong></td>
                    <td></td>
                </tr>
                </tfoot>
            </table>
        </div>

        <div class="mt-3">
            <form action="/cart/clear" method="post" style="display:inline;">
                <@main.csrf />
                <button type="submit" class="btn btn-warning"><@spring.message "cart.clear"/></button>
            </form>
            <a href="/orders/checkout" class="btn btn-success"><@spring.message "cart.checkout"/></a>
        </div>
    </#if>

</@main.layout>

