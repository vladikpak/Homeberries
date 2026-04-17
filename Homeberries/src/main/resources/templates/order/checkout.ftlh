<#import "../layout/main.ftlh" as main>
<#import "../spring.ftl" as spring>
<@main.layout "Checkout">

    <div class="row">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    <h4><@spring.message "checkout.title"/></h4>
                </div>
                <div class="card-body">
                    <h5><@spring.message "checkout.your_order"/></h5>
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
                            <#list cart.items as item>
                                <tr>
                                    <td>${item.productName}</td>
                                    <td>${item.productPrice} сом</td>
                                    <td>${item.quantity}</td>
                                    <td>${item.productPrice * item.quantity} сом</td>
                                </tr>
                            </#list>
                            </tbody>
                            <tfoot>
                            <tr class="table-dark">
                                <td colspan="3" class="text-end"><strong><@spring.message "cart.total"/>:</strong></td>
                                <td><strong>${totalAmount} сом</strong></td>
                            </tr>
                            </tfoot>
                        </table>
                    </div>

                    <form action="/orders/checkout" method="post" class="mt-4">
                        <@main.csrf />
                        <a href="/cart" class="btn btn-secondary btn w-100" style="margin-bottom: 20px"><@spring.message "cart.back"/></a>
                        <button type="submit" class="btn btn-success btn-lg w-100">
                            <@spring.message "checkout.confirm"/>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</@main.layout>

