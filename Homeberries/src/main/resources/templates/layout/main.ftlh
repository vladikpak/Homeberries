<#import "../spring.ftl" as spring>
<#macro csrf>
    <#if _csrf??>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </#if>
</#macro>

<#macro layout pageTitle>
    <!DOCTYPE html>
    <html lang="ru">
    <head>
        <meta charset="UTF-8">
        <title>${pageTitle} | HomeBerries</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    </head>
    <body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="/">HomeBerries</a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Переключить навигацию">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarContent">

                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="/"><@spring.message "nav.home"/></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/categories"><@spring.message "nav.categories"/></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/products"><@spring.message "nav.products"/></a>
                    </li>

                    <#if SPRING_SECURITY_CONTEXT??>
                        <#assign user = SPRING_SECURITY_CONTEXT.authentication.principal>
                        <#if user.authorities?seq_contains("ROLE_ADMIN")>
                            <li class="nav-item">
                                <a class="nav-link text-warning" href="/admin/products/new">
                                    <i class="fas fa-plus-circle"></i> Добавить товар
                                </a>
                            </li>
                        </#if>
                    </#if>
                </ul>

                <div class="d-flex align-items-center flex-wrap gap-2">
                    <#if SPRING_SECURITY_CONTEXT??>
                        <#assign user = SPRING_SECURITY_CONTEXT.authentication.principal>
                        <a href="/cart" class="btn btn-outline-light btn-sm">
                            <i class="fas fa-shopping-cart"></i> <@spring.message "nav.cart"/>
                        </a>
                        <a href="/profile" class="btn btn-outline-light btn-sm">
                            <i class="fas fa-user"></i> <@spring.message "nav.profile"/>
                        </a>
                        <a href="/orders" class="btn btn-outline-light btn-sm"><@spring.message "nav.orders"/></a>
                        <span class="navbar-text text-white">${user.username}</span>
                        <form action="/auth/logout" method="post" class="d-inline">
                            <@csrf />
                            <button class="btn btn-outline-light btn-sm" type="submit"><@spring.message "nav.logout"/></button>
                        </form>
                    <#else>
                        <a href="/auth/login" class="btn btn-outline-light btn-sm"><@spring.message "nav.login"/></a>
                        <a href="/auth/register" class="btn btn-primary btn-sm"><@spring.message "nav.register"/></a>
                    </#if>

                    <div class="dropdown">
                        <button class="btn btn-secondary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown">
                            <#assign currentLang = .locale>
                            <#if currentLang == "en">
                                English
                            <#else>
                                Русский
                            </#if>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item ${(currentLang == 'en')?then('active', '')}" href="?lang=en">English</a></li>
                            <li><a class="dropdown-item ${(currentLang == 'ru')?then('active', '')}" href="?lang=ru">Русский</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <#if error?? && error?is_string>
            <div class="alert alert-danger">${error}</div>
        </#if>

        <#if success?? && success?is_string>
            <div class="alert alert-success">${success}</div>
        </#if>
        <#nested>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    </body>
    </html>
</#macro>
