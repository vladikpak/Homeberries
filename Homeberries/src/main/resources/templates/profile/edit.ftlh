<#import "../layout/main.ftlh" as main>
<#import "../spring.ftl" as spring>
<@main.layout "Редактировать профиль">

    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <i class="fas fa-user-edit"></i> <@spring.message "common.edit"/>
                </div>
                <div class="card-body">
                    <#if error??>
                        <div class="alert alert-danger">${error}</div>
                    </#if>
                    <#if success??>
                        <div class="alert alert-success">${success}</div>
                    </#if>

                    <form action="/profile/edit" method="post">
                        <#if _csrf??>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </#if>
                        <div class="mb-3">
                            <label><@spring.message "profile.name"/></label>
                            <input type="text" name="name" class="form-control"
                                   value="${user.name}" required>
                        </div>
                        <div class="mb-3">
                            <label><@spring.message "profile.email"/></label>
                            <input type="email" class="form-control"
                                   value="${user.email}" readonly disabled>
                            <small class="text-muted"> <@spring.message "common.application"/></small>
                        </div>
                        <div class="mb-3">
                            <label><@spring.message "profile.phone"/></label>
                            <input type="tel" name="phone" class="form-control"
                                   value="${user.phone!''}">
                        </div>
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save"></i> <@spring.message "common.save"/>
                        </button>
                        <a href="/profile" class="btn btn-secondary"> <@spring.message "common.cancel"/></a>
                    </form>
                </div>
            </div>
        </div>
    </div>

</@main.layout>