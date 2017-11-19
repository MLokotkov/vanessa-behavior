﻿
///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Behavior
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,ОписаниеШага,ТипШага,Транзакция,Параметр);
	
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯЗадаюТаблицуСтрок(Парам01,ТабПарам)","ЯЗадаюТаблицуСтрок","Дано Я задаю таблицу строк ""ТаблицаИсключений""" + Символы.ПС + "| 'Товар1' |" + Символы.ПС + "| 'Товар2' |","Создает в памяти таблицу строк по переданной таблице","Контекст.Контекст.Сохранить значение.Временная таблица");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ДляКаждогоЗначенияИзМассива(Парам01,Парам02)","ДляКаждогоЗначенияИзМассива","И для каждого значения ""ЗначениеИзМассива"" из массива ""МассивЗначенийЧерезТочкуСЗапятой""","Перебирает массив значений. Первый параметр - это имя переменной, которое будет доступно в Контексте. Второй параметр, значения массива, разделенные символом "";""","Прочее","Цикл");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ДляКаждогоЗначенияИзТаблицыВПамяти(Парам01,Парам02)","ДляКаждогоЗначенияИзТаблицыВПамяти","И для каждого значения ""ЗначениеИзМассива"" из таблицы в памяти ""МассивЗначенийЧерезТочкуСЗапятой""","Перебирает значение из указанной переменной. Первый параметр - это имя переменной, которое будет доступно в Контексте. Второй параметр, имя таблицы, которая сохранена в контексте." + Символы.ПС + "Если в переданной таблице одна колонка - тогда она интерпретируется как массив. Иначе - как таблица, где в первой строке указаны имена колонок. По мере перебора строк таблицы будут обновляться значения в переменной Контекст. Имена переменных равны именам колонок. Имя колонки должно соответствовать правилам образования ключей структуры.","Прочее","Цикл");

	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//И для каждого значения "ЗначениеИзМассива" из массива "МассивЗначенийЧерезТочкуСЗапятой"
//@ДляКаждогоЗначенияИзМассива(Парам01,Парам02)
Процедура ДляКаждогоЗначенияИзМассива(ИмяПеременной,ЗначенияСтрокой) Экспорт
	
	ИмяЦикла = "Цикл" + ИмяПеременной;//тут будет храниться счетчик
	Если НЕ Контекст.Свойство(ИмяЦикла) Тогда
		Контекст.Вставить(ИмяЦикла,-1);
	КонецЕсли;	 
	
	Контекст[ИмяЦикла] = Контекст[ИмяЦикла] + 1;
	МассивЗначений = Ванесса.РазложитьСтрокуВМассивПодстрокКлиент(ЗначенияСтрокой,";");
	
	Если МассивЗначений.Количество()-1 < Контекст[ИмяЦикла] Тогда
		//значит цикл закончился
		Ванесса.УстановитьРезультатУсловия(Ложь);
		Контекст.Удалить(ИмяЦикла);
		Возврат;
	КонецЕсли;	 
	
	Контекст.Вставить(ИмяПеременной,МассивЗначений[Контекст[ИмяЦикла]]);
	Ванесса.УстановитьРезультатУсловия(Истина);
КонецПроцедуры


&НаКлиенте
//И для каждого значения "ЗначениеИзМассива" из таблицы в памяти "МассивЗначенийЧерезТочкуСЗапятой"
//@ДляКаждогоЗначенияИзТаблицыВПамяти(Парам01,Парам02)
Процедура ДляКаждогоЗначенияИзТаблицыВПамяти(ИмяПеременной,ИмяТаблицы) Экспорт
	ИмяЦикла = "Цикл" + ИмяПеременной;//тут будет храниться счетчик
	МассивЗначений = Контекст[ИмяТаблицы];
	
	ЭтоМассив = Истина;
	Если МассивЗначений.Количество() > 0 Тогда
		Если ТипЗнч(МассивЗначений[0]) = Тип("Структура") Тогда
			//значит это передана таблица с несколькими колонками
			//в первой строке хранятся имена переменных
			ЭтоМассив = Ложь;
		КонецЕсли;	 
	КонецЕсли;	 
	
	Если НЕ Контекст.Свойство(ИмяЦикла) Тогда
		Если ЭтоМассив Тогда
			Контекст.Вставить(ИмяЦикла,-1);
		Иначе
			//т.к. в первой строке имена колонок
			Контекст.Вставить(ИмяЦикла,0);
		КонецЕсли;	 
	КонецЕсли;	 
	
	Контекст[ИмяЦикла] = Контекст[ИмяЦикла] + 1;
	
	Если МассивЗначений.Количество()-1 < Контекст[ИмяЦикла] Тогда
		//значит цикл закончился
		Ванесса.УстановитьРезультатУсловия(Ложь);
		Контекст.Удалить(ИмяЦикла);
		Возврат;
	КонецЕсли;	 
	
	Если ЭтоМассив Тогда
		Контекст.Вставить(ИмяПеременной,МассивЗначений[Контекст[ИмяЦикла]]);
	Иначе
		СтрокаКолонок    = МассивЗначений[0];
		ТекСтрокаТаблицы = МассивЗначений[Контекст[ИмяЦикла]];
		
		Для Каждого ЭлементСтруктуры Из СтрокаКолонок Цикл
			ИмяПеременной = ЭлементСтруктуры.Значение;
			Контекст.Вставить(ИмяПеременной,ТекСтрокаТаблицы[ЭлементСтруктуры.Ключ]);
		КонецЦикла;	
	КонецЕсли;	 
	Ванесса.УстановитьРезультатУсловия(Истина);
КонецПроцедуры


&НаКлиенте
//Дано Я задаю таблицу строк "ТаблицаИсключений"
//@ЯЗадаюТаблицуСтрок(Парам01,ТабПарам)
Процедура ЯЗадаюТаблицуСтрок(ИмяТаблицыВПамяти,ТабПарам) Экспорт
	Массив = Новый Массив;
	
	ЭтоМассив = Истина;
	Если ТабПарам.Количество() > 0 Тогда
		Если ТабПарам[0].Количество() >  1 Тогда
			//значит это передана таблица с несколькими колонками
			//в первой строке хранятся имена переменных
			ЭтоМассив = Ложь;
		КонецЕсли;	 
	КонецЕсли;	 
	
	Для Каждого СтрокаТабПарам Из ТабПарам Цикл
		Если ЭтоМассив Тогда
			Массив.Добавить(СтрокаТабПарам.Кол1);
		Иначе	
			Массив.Добавить(СтрокаТабПарам);
		КонецЕсли;	 
	КонецЦикла;	
	
	Контекст.Вставить(ИмяТаблицыВПамяти,Массив);
КонецПроцедуры
