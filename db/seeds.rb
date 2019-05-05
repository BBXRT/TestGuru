# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

User.create(name: 'Ivan')

Category.create(title: 'SQL')
Category.create(title: 'Ruby')
Category.create(title: 'Rails')

Test.create(title: 'Тест по SQL DDL', level: 1, category_id: 1)
Test.create(title: 'Тест по SQL DML', level: 1, category_id: 1)
Test.create(title: 'Тест по SQL DQL', level: 1, category_id: 1)
Test.create(title: 'Тест по Ruby', level: 1, category_id: 2)
Test.create(title: 'Тест по Rails', level: 3, category_id: 3)

Question.create(body: 'Для чего используется команда CREATE?', test_id: 1)
Question.create(body: 'Для чего используется команда INSERT?', test_id: 2)
Question.create(body: 'Для чего используется команда SELECT?', test_id: 3)
Question.create(body: 'Что такое Ruby?', test_id: 4)
Question.create(body: 'Что такое Rails', test_id: 5)

Answer.create(body: 'Не знаю', question_id: 1, correct: true)

PassedTest.create(user_id: 1, test_id: 1)
PassedTest.create(user_id: 1, test_id: 2)
PassedTest.create(user_id: 2, test_id: 3)
PassedTest.create(user_id: 2, test_id: 777)
PassedTest.create(user_id: 2, test_id: 1337)
