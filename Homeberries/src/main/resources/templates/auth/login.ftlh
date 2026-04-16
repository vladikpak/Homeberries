<#import "../layout/main.ftlh" as main>
<#import "../spring.ftl" as spring>
<@main.layout "Вход">
    <div class="row justify-content-center">
        <div class="col-md-4">
            <div class="card">
                <div class="card-header"><@spring.message "nav.login"/></div>
                <div class="card-body">

                    <#if registered??>
                        <div class="alert alert-success">
                             Регистрация прошла успешно! Теперь вы можете войти.
                        </div>
                    </#if>

                    <#if error??>
                        <div class="alert alert-danger">
                             Неверный email или пароль
                        </div>
                    </#if>

                    <#if logout??>
                        <div class="alert alert-info">
                            Вы вышли из аккаунта
                        </div>
                    </#if>

                    <form action="/auth/login" method="post">
                        <@main.csrf />
                        <div class="mb-3">
                            <label><@spring.message "profile.email"/></label>
                            <input type="email" name="username" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label><@spring.message "profile.password"/></label>
                            <input type="password" name="password" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-primary"><@spring.message "nav.enter"/></button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</@main.layout>