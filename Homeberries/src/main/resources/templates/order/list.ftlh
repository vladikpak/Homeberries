<#import "../layout/main.ftlh" as main>
<#import "../spring.ftl" as spring>
<@main.layout "Orders">

    <h2><@spring.message "order.title"/></h2>

    <#if error??>
        <div class="alert alert-danger">${error}</div>
    </#if>

    <#if orders?size == 0>
        <div class="alert alert-info">
            <p><@spring.message "order.empty"/></p>
            <a href="/products" class="btn btn-primary"><@spring.message "order.continue"/></a>
        </div>
    <#else>
        <div class="table-responsive">
            <table class="table table-hover">
                <thead class="table-dark">
                <tr>
                    <th><@spring.message "order.number"/></th>
                    <th><@spring.message "order.total"/></th>
                    <th><@spring.message "order.status"/></th>
                    <th><@spring.message "order.date"/></th>
                    <th><@spring.message "order.details"/></th>
                </tr>
                </thead>
                <tbody>
                <#list orders as order>
                    <tr>
                        <td>${order.id}</td>
                        <td>${order.totalAmount} Сом</td>
                        <td>
                            <#if order.status == "NEW">
                                <span class="badge bg-primary"><@spring.message "order.new"/></span>
                            <#elseif order.status == "PAID">
                                <span class="badge bg-success"><@spring.message "order.paid"/></span>
                            <#elseif order.status == "DELIVERED">
                                <span class="badge bg-info"><@spring.message "order.delivered"/></span>
                            <#else>
                                <span class="badge bg-secondary">${order.status}</span>
                            </#if>
                        </td>
                        <td>${order.createdAt}</td>
                        <td>
                            <a href="/orders/${order.id}" class="btn btn-sm btn-primary"><@spring.message "order.details"/></a>
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>
        </div>

        <#if totalPages?? && totalPages gt 1>
            <nav>
                <ul class="pagination justify-content-center">
                    <#if currentPage == 0>
                        <li class="page-item disabled"><span class="page-link">«</span></li>
                    <#else>
                        <li class="page-item"><a class="page-link" href="?page=${currentPage - 1}">«</a></li>
                    </#if>
                    <#list 0..totalPages-1 as i>
                        <#if currentPage == i>
                            <li class="page-item active"><span class="page-link">${i + 1}</span></li>
                        <#else>
                            <li class="page-item"><a class="page-link" href="?page=${i}">${i + 1}</a></li>
                        </#if>
                    </#list>
                    <#if currentPage == totalPages-1>
                        <li class="page-item disabled"><span class="page-link">»</span></li>
                    <#else>
                        <li class="page-item"><a class="page-link" href="?page=${currentPage + 1}">»</a></li>
                    </#if>
                </ul>
            </nav>
        </#if>
    </#if>

</@main.layout>

