﻿# language: ru

@IgnoreOnCIMainBuild
@SpecialTag

Функционал: Загрузить фичу в vanessa-behavior
	Как Разработчик
	Я Хочу чтобы чтобы у меня была возможность загрузить произвольную тестовую фичу в vanessa-behavior
 

Сценарий: Загрузка тестовой фичи проверка с выбранного шага

	Когда Я увеличил значение "СлужебныйПараметр" в КонтекстСохраняемый на 1
	И     Этот шаг вообще не реализован
	И     Я могу продолжить выполнение шагов в хост системе

