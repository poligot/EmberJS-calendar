App = require 'app'

###*
  Controller KalendarController

  @class CalendarController
  @namespace App
  @extends Ember.Controller
###
module.exports = App.CalendarController = Ember.Controller.extend
  # put your code here
  monthName: (()->
    arrMonth = [
      "Нулябрь"
      "Январь"
      "Февраль"
      "Март"
      "Апрель"
      "Май"
      "Июнь"
      "Июль"
      "Август"
      "Сентябрь"
      "Октябрь"
      "Ноябрь"
      "Декабрь" 
    ]
    arrMonth[@get('month')]
  ).property ('month')  

  dayArr: [
    "Пн"
    "Вт"
    "Ср"
    "Чт"
    "Пт"
    "Сб"
    "Вс"
  ]
  

  matrixDay:(()->
    month = @get('month') - 1
    year = @get('year')
    dayurl = @get('day')
    now = new Date()
    currentDate= now.getDate()
    d = new Date(year, month, 1)
    day = d.getDay()  
    day = if day is 0 then 6 else day - 1
    days = 32 - new Date(year, month, 32).getDate()
    arr1 = Array(day)
    arr2 = []
    controller = @
    [1..days].forEach (item)-> 
      arr2.push Ember.Object.create
        date: item
        isSelected:
          Number(item) is Number(dayurl)
        isToday:
          Number(currentDate) is Number(item)
    arr3 = Array(42-(day+days))
    dayArr = (arr1.concat arr2).concat arr3
    days = []
    days.push(dayArr.slice(i,i+7)) for i in [0,7,14,21,28,35]
    return days 
  ).property 'year', 'month' , 'day'

  actions:
    prevYear: ()->
      year = parseInt(@get('year'),10) - 1
      month = @get('month')
      day = @get('day')
      @transitionToRoute('day', year, month, day)

    nextYear: ()->
      year = parseInt(@get('year'),10) + 1
      month = @get('month')
      day = @get('day')
      @transitionToRoute('day', year, month, day)      

    prevMonth: ()->
      year = parseInt(@get('year'),10)
      month = parseInt(@get('month'),10)
      day = @get('day')
      if month is 1
        year -= 1
        month = 12
      else
        month -= 1  
      @transitionToRoute('day', year, month, day)

    nextMonth: ()->
      month = parseInt(@get('month'),10)
      year = parseInt(@get('year'),10)
      day = @get('day')
      if month is 12
        year += 1
        month = 1
      else
        month+=1          
      @transitionToRoute('day', year, month, day)

    selectedDay: (dayN)->
      month = parseInt(@get('month'),10)
      year = parseInt(@get('year'),10)
      day = dayN
      @transitionToRoute('day', year, month, day)           