$(document).on 'click', '.new-product, #add-product', (e) ->
  $.ajax
    url: "/products/new"
    dataType: "script"
    type: "GET"

$(document).on 'dblclick', '.product-row, .product-item', (e) ->
  product_id = $(this).attr("data-product-id")
  $.ajax
    url: "/products/edit_modal"
    dataType: "script"
    type: "GET"
    data:
      product_id: product_id

$(document).on 'click', '#sell-product', (e) ->
  product_id = $(this).parents('tr').attr("data-product-id")
  $.ajax
    url: "/products/sell_modal"
    dataType: "script"
    type: "GET"
    data:
      product_id: product_id

$(document).on 'click', '#sell-product-btn', (e) ->
  product_id = $('#product_id').val()
  sell_price = $('input#product_sell_price').val()
  sell_count = $('input#product_available').val()
  if sell_price != ''
    $.ajax
      url: "/products/sell"
      dataType: "script"
      type: "GET"
      data:
        product_id: product_id
        sell_price: sell_price
        sell_count: sell_count