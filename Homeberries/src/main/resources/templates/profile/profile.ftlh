<#import "../layout/main.ftlh" as main>
<#import "../spring.ftl" as spring>
<@main.layout "Мой профиль">

    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body text-center">
                    <i class="fas fa-user-circle fa-5x text-primary mb-3"></i>
                    <h4>${user.name}</h4>
                    <p class="text-muted">${user.email}</p>
                    <#if user.phone??>
                        <p><i class="fas fa-phone"></i> ${user.phone}</p>
                    </#if>
                    <p><i class="fas fa-tag"></i><@spring.message "common.role"/>: ${user.role!"Пользователь"}</p>
                    <a href="/profile/edit" class="btn btn-primary mt-3">
                        <i class="fas fa-edit"></i><@spring.message "profile.edit"/>
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    <i class="fas fa-shopping-bag"></i> <@spring.message "order.title"/>
                </div>
                <div class="card-body">
                    <a href="/orders" class="btn btn-outline-primary">
                        <i class="fas fa-list"></i> <@spring.message "order.all"/>
                    </a>
                </div>
            </div>

            <div class="card mt-3">
                <div class="card-header">
                    <i class="fas fa-info-circle"></i> <@spring.message "common.information"/>
                </div>
                <div class="card-body">
                    <#if user.createdAt??>
                    <p><strong><@spring.message "common.createdData"/>:</strong> ${user.createdAt}</p>
                    <#else>
                     <p><strong><@spring.message "common.createdData"/>:</strong><@spring.message "common.neg"/></p>
                     </#if>
                </div>
            </div>
        </div>
    </div>

</@main.layout>