<#import "../layout/main.ftlh" as main>
<#import "../spring.ftl" as spring>
<@main.layout "Регистрация">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header"><@spring.message "nav.register"/></div>
                <div class="card-body">
                    <form action="/auth/register" method="post">
                        <@main.csrf />
                        <div class="mb-3">
                            <label><@spring.message "profile.name"/></label>
                            <input type="text" name="name" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label><@spring.message "profile.email"/></label>
                            <input type="email" name="email" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label><@spring.message "profile.phone"/></label>
                            <input type="tel" name="phone" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label><@spring.message "profile.password"/></label>
                            <input type="password" name="password" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-primary"><@spring.message "profile.register1"/></button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</@main.layout>