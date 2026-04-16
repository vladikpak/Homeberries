<#import "../layout/main.ftlh" as main>
<@main.layout "Корзина">
    <h2>Корзина</h2>
    <#if cart.items?size == 0>
        <p>Корзина пуста</p>
        <a href="/products" class="btn btn-primary">Перейти к покупкам</a>
    <#else>
        <table class="table">
            <thead>
            <tr>
                <th>Товар</th>
                <th>Цена</th>
                <th>Количество</th>
                <th>Сумма</th>
                <th>Действия</th>
            </thead>
            <tbody>
            <#list cart.items as item>
                <tr>
                    <td>${item.product.name}</td>
                    <td>${item.product.price} ₽</td>
                    <td>
                        <form action="/cart/update/${item.product.id}" method="post" style="display:inline;">
                            <input type="number" name="quantity" value="${item.quantity}" min="1" style="width:60px;">
                            <button type="submit" class="btn btn-sm btn-primary">Обновить</button>
                        </form>
                    </td>
                    <td>${item.product.price * item.quantity} ₽</td>
                    <td>
                        <form action="/cart/remove/${item.product.id}" method="post" style="display:inline;">
                            <button type="submit" class="btn btn-sm btn-danger">Удалить</button>
                        </form>
                    </td>
                </tr>
            </#list>
            </tbody>
        </table>
        <h4>Итого: ${totalAmount} ₽</h4>
        <form action="/cart/clear" method="post" style="display:inline;">
            <button type="submit" class="btn btn-warning">Очистить корзину</button>
        </form>
        <a href="/orders/checkout" class="btn btn-success">Оформить заказ</a>
    </#if>
</@main.layout>