<#import "layout/main.ftlh" as main>
<@main.layout "Главная">
    <div id="mainCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="0" class="active"></button>
            <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="1"></button>
            <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="2"></button>
        </div>

        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="/uploads/banners/0d390504f92d8e4f4da00be99045525b.jpg" class="d-block w-100" alt="Слайд 1">
                <div class="carousel-caption d-none d-md-block">
                    <h5 class="text-white bg-dark d-inline-block p-2 rounded">Скидки до 50%</h5>
                </div>
            </div>

            <div class="carousel-item">
                <img src="/uploads/banners/c25c94fe96_1000.jpg" class="d-block w-100" alt="Слайд 2">
                <div class="carousel-caption d-none d-md-block">
                    <h5 class="text-white bg-dark d-inline-block p-2 rounded">Новинки сезона</h5>
                </div>
            </div>

            <div class="carousel-item">
                <img src="/uploads/banners/images (1).jpg" class="d-block w-100" alt="Слайд 3">
                <div class="carousel-caption d-none d-md-block">
                    <h5 class="text-white bg-dark d-inline-block p-2 rounded">Бесплатная доставка</h5>
                </div>
            </div>
        </div>

        <button class="carousel-control-prev" type="button" data-bs-target="#mainCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#mainCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
        </button>
    </div>
</@main.layout>