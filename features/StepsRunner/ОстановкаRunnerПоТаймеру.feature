# language: ru




Функционал: Остановка выполнения шагов FeatureRunner
	Как Разработчик
	Я Хочу чтобы у меня была возможность остановить выполнения сценария для использования таймера

Сценарий: Остановка и продолжение выполнения сценария для использования таймера
	Когда Я останавливаю выполнение шагов для использования таймера
#	В обработке будет запущен таймер и из него будет запущено продолжение выполнения шагов
	Тогда Второй шаг поместит в переменную контекст служебное значение "Тест"
	И на третьем шаге я могу обратиться к этому служебному значению "Тест"
