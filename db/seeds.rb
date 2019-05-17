# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

user1 = User.create(name: 'Ivan', email: 'abc@abc.com')

cat1 = Category.create(title: 'SQL')
cat2 = Category.create(title: 'Ruby')
cat3 = Category.create(title: 'Rails')

test1 = Test.create(title: 'Тест по SQL DDL', level: 1, category_id: cat1.id)
test2 = Test.create(title: 'Тест по SQL DML', level: 1, category_id: cat1.id)
test3 = Test.create(title: 'Тест по SQL DQL', level: 1, category_id: cat1.id)
test4 = Test.create(title: 'Тест по Ruby', level: 1, category_id: cat2.id)
test5 = Test.create(title: 'Тест по Rails', level: 3, category_id: cat3.id)

q1 = Question.create(body: 'Для чего используется команда CREATE?', test_id: test1.id)
q2 = Question.create(body: 'Для чего используется команда INSERT?', test_id: test2.id)
q3 = Question.create(body: 'Для чего используется команда SELECT?', test_id: test3.id)
q4 = Question.create(body: 'Что такое Ruby?', test_id: test4.id)
q5 = Question.create(body: 'Что такое Rails?', test_id: test5.id)
q6 = Question.create(body: 'Зачем нужен Rails?', test_id: test5.id)

a1 = Answer.create(body: 'Не знаю', question_id: q1.id, correct: true)

PassedTest.create(user_id: user1.id, test_id: test1.id)
PassedTest.create(user_id: user1.id, test_id: test2.id)
PassedTest.create(user_id: user1.id, test_id: test3.id)
PassedTest.create(user_id: user1.id, test_id: test4.id)
PassedTest.create(user_id: user1.id, test_id: test5.id)
