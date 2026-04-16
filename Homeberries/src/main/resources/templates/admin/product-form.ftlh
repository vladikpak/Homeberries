<#import "../layout/main.ftlh" as main>
<#import "../spring.ftl" as spring>
<@main.layout "Добавить товар">

    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    <i class="fas fa-plus-circle"></i> Добавить товар
                </div>
                <div class="card-body">

                    <#if error??>
                        <div class="alert alert-danger">
                            <i class="fas fa-exclamation-triangle"></i> ${error}
                        </div>
                    </#if>

                    <form action="/admin/products/new" method="post" enctype="multipart/form-data">
                        <@main.csrf />

                        <div class="mb-3">
                            <label class="form-label">Название товара *</label>
                            <input type="text" name="name" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Описание</label>
                            <textarea name="description" class="form-control" rows="4" placeholder="Подробное описание товара..."></textarea>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Цена (₽) *</label>
                                <input type="number" name="price" class="form-control" required min="0" step="1">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Количество на складе</label>
                                <input type="number" name="stock" class="form-control" value="0" min="0">
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Категория</label>
                            <select name="categoryId" class="form-control">
                                <option value="">-- Без категории --</option>
                                <#list categories as cat>
                                    <option value="${cat.id}">${cat.name}</option>
                                </#list>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Изображение товара *</label>
                            <input type="file" name="imageFile" class="form-control" accept="image/*" required>
                            <small class="text-muted">Поддерживаются форматы: JPG, PNG, GIF, WEBP</small>
                        </div>

                        <div class="d-flex gap-2">
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save"></i> Сохранить товар
                            </button>
                            <a href="/products" class="btn btn-secondary">
                                <i class="fas fa-times"></i> Отмена
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</@main.layout>