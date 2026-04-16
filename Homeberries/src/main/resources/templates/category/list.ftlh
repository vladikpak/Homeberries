<#import "../layout/main.ftlh" as main>
<@main.layout "Категория">
<div class="categories-section">
    <h2 class="mb-4">Категории</h2>

    <div class="row g-3">
        <div class="col-md-4 col-sm-6">
            <a href="/products?categoryId=1" class="category-card">
                <i class="fas fa-shoe-prints"></i>
                <span>Обувь</span>
            </a>
        </div>
        <div class="col-md-4 col-sm-6">
            <a href="/products?categoryId=2" class="category-card">
                <i class="fas fa-child"></i>
                <span>Детям</span>
            </a>
        </div>
        <div class="col-md-4 col-sm-6">
            <a href="/products?categoryId=3" class="category-card">
                <i class="fas fa-male"></i>
                <span>Мужчинам</span>
            </a>
        </div>
        <div class="col-md-4 col-sm-6">
            <a href="/products?categoryId=4" class="category-card">
                <i class="fas fa-mobile-alt"></i>
                <span>Электроника</span>
            </a>
        </div>
        <div class="col-md-4 col-sm-6">
            <a href="/products?categoryId=5" class="category-card">
                <i class="fas fa-home"></i>
                <span>Дом</span>
            </a>
        </div>
        <div class="col-md-4 col-sm-6">
            <a href="/products?categoryId=6" class="category-card">
                <i class="fas fa-futbol"></i>
                <span>Спорт</span>
            </a>
        </div>
    </div>
</div>

<style>
    .categories-section {
        background: #fff;
        border-radius: 12px;
        padding: 20px;
    }

    .category-card {
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: center;
        padding: 20px 12px;
        background: #f8f9fa;
        border-radius: 12px;
        text-decoration: none;
        transition: all 0.3s ease;
        color: #333;
    }

    .category-card:hover {
        transform: translateY(-4px);
        background: #e9ecef;
        color: #007bff;
    }

    .category-card i {
        font-size: 32px;
        margin-bottom: 10px;
        color: #666;
    }

    .category-card:hover i {
        color: #007bff;
    }

    .category-card span {
        font-size: 16px;
        font-weight: 500;
    }

    @media (max-width: 576px) {
        .category-card {
            padding: 12px 8px;
        }
        .category-card i {
            font-size: 24px;
        }
        .category-card span {
            font-size: 13px;
        }
    }
</style>
</@main.layout>