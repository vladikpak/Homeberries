<#import "../layout/main.ftlh" as main>
<#import "../spring.ftl" as spring>
<@main.layout "Заказ №${order.id}">

    <div class="row">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    <h4><@spring.message "order.detail.title"/> ${order.id}</h4>
                </div>
                <div class="card-body">
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <strong><@spring.message "order.status"/>:</strong>
                            <#if order.status == "NEW">
                                <span class="badge bg-primary"><@spring.message "order.new"/></span>
                            <#elseif order.status == "PAID">
                                <span class="badge bg-success"><@spring.message "order.paid"/></span>
                            <#elseif order.status == "DELIVERED">
                                <span class="badge bg-info"><@spring.message "order.delivered"/></span>
                            <#else>
                                <span class="badge bg-secondary">${order.status}</span>
                            </#if>
                        </div>
                        <div class="col-md-6">
                            <strong><@spring.message "order.date"/>:</strong> ${order.createdAt}
                        </div>
                    </div>

                    <h5>Товары:</h5>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th><@spring.message "filters.name"/></th>
                                <th><@spring.message "product.price"/></th>
                                <th><@spring.message "product.quantity"/></th>
                                <th><@spring.message "cart.total"/></th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list order.items as item>
                                <tr>
                                    <td>${item.productName}</td>
                                    <td>${item.price} ₽</td>
                                    <td>${item.quantity}</td>
                                    <td>${item.price * item.quantity} ₽</td>
                                </tr>
                            </#list>
                            </tbody>
                            <tfoot>
                            <tr class="table-dark">
                                <td colspan="3" class="text-end"><strong><@spring.message "cart.total"/>:</strong></td>
                                <td><strong>${order.totalAmount} ₽</strong></td>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card">
                <div class="card-header">
                    <h5><@spring.message "order.info.title"/></h5>
                </div>
                <div class="card-body">
                    <a href="/orders" class="btn btn-secondary w-100 mb-2"><@spring.message "order.back_to_list"/></a>
                    <a href="/products" class="btn btn-primary w-100"><@spring.message "order.continue"/></a>
                </div>
            </div>
        </div>
    </div>

</@main.layout>