$ ->


  waitForMap ->

    #http://geocode-maps.yandex.ru/1.x/?geocode=OLOLOLO
    @map = new ymaps.Map($("#map")[0], {center: [55.123770, 61.492089], zoom: 12})


    placemark = new ymaps.Placemark(
      [55.123770, 61.492089],
    {
      balloonContent: '454119, город Челябинск, Копейское шоссе, дом 23 <br/> <br/> Телефоны отдела продаж: (351) 268 95 61, (351) 278 81 51'
    }
    )

    @map.geoObjects.add(placemark)
    placemark.balloon.open()

window.waitForMap = (callback) ->
  if ymaps.Map
    callback(this)
  else
    setTimeout(
      ->
        waitForMap(callback)
      500
    )

