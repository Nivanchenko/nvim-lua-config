#Использовать oscript-fzy

Поиск = Новый Поиск(); // Создание поиска

Массив = Новый Массив();
Массив.Добавить("app/models/user.rb");
Массив.Добавить("app/models/customer.rc");
Массив.Добавить("app/models/block.rc");

Поиск.ЗагрузитьДанные(Массив); // Загрузка источника поиска

Результат = Поиск.НайтиЗначенияИлиКлючи("amuser", 1);
Сообщить(Результат);