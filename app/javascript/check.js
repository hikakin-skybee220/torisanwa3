$(plusId).click(function(){
    var getId = $(this).parents('.menu').attr('id');     
    var count = $('#number'+getId).text(); 
    var originalPrice = $(this).parents('.menu').find('#f_price'+getId).text();
    let originalPriceNumber = removeComma(originalPrice);
    var totalPrice = $('#totalPrice').text();
    let totalPriceNumber = removeComma(totalPrice);
    var orderId = $(this).parents('.circles').find('.m_hidden_quantity').attr('id');        

    count++;
    $('#number'+getId).text(count);
    $('#s_price'+getId).text(count*originalPriceNumber);
    $('#totalPrice').text(totalPriceNumber+originalPriceNumber);

    let againPrice = addComma(document.getElementById('s_price'+getId).textContent);
    $('#s_price'+getId).text(againPrice);

    let againTotalPrice = addComma(document.getElementById('totalPrice').textContent);
    $('#totalPrice').text(againTotalPrice);

    $.ajax({
        url: '/quantity/'+orderId + '/update',
        type: 'post',
        data: {
            order: {
                quantity: count
            }
        }
    })
    
})