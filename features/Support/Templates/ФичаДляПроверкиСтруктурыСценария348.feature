# language: ru

@IgnoreOnCIMainBuild

Функционал: Планирование ресурсов

Контекст: 
    Когда Проект12 состоит из 1 скважины, глубиной 4000м, и 2 этапов: 'Строительство дорог' длящееся с января по март и 'Бурение направления' с апреля по август
    И Проект22 состоит из 2 скважин: Пупкинская, глубиной 2000, и 'Глубокая' глубиной 4000м. Этапы проекта: 'Строительство дорог, Скважина Пупкинская' длящееся с января по март и 'Бурение направления' с апреля по август
    И существует единственный сценарий 


Структура сценария: Планирование ресурсов
Дано: создан документ План ресурсов, в шапке которого указаны <Сценарий> и <Проект>
Когда В строке документа указаны следующие ресурсы <Номенклатура>,<Количество> с параметрами расхода: <Вид Расхода>, <Период> с условием расхода: <Условие распределения расходов>, <База распределения по этапам>, <Вид объекта>, <Сезонные коэффициенты> 
Тогда в результате расчета будет сформирован следующий план расхода <Результат расчета>

Примеры:


|Строка | Сценарий | Проект | Номенклатура | Количество  | Вид Расхода | Период | Условие распределения расходов | База распределения по этапам | Вид объекта |Сезонные коэффициенты| Результат расчета

|1|| Проект12 | Труба обсадная | 10  | фиксированный || глубина 3000м | Длительность (сутки)  | Скважина || Труба обсадная в марте по этапу 'Строительство дорог' 3,33 и в апреле-мае по этапу 'Бурение направления' по 6,66 соответственно
|2|| Проект12 | Труба обсадная | 10  | на месяц | март-апрель 2017г | глубина 3000м | Длительность (сутки) | Скважина || Труба обсадная в марте по этапу 'Строительство дорог' и в апреле-мае по этапу 'Бурение направления' по 10 шт/месяц


|1|| Проект12 | Труба обсадная | 10  | на месяц | март-апрель 2017г | глубина 3000м | Проходка | Скважина || Труба обсадная с марта по апрель по этапу1 по 10 шт/месяц
|1|| Проект12 | Труба обсадная | 10  | на месяц | март-апрель 2017г | глубина 3000м | Проходка | Скважина || Труба обсадная с марта по апрель по этапу1 по 10 шт/месяц