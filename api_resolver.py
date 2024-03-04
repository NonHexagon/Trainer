import os
import uuid
from flask import *  # модуль для создания веб-приложений

application = Flask(__name__)  # инициализация экземпляра класса веб-приложения на котором будем собирать проект
application.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:////First.db'  # инициализация базы данных в проекте
application.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False  # игнорируем не работающую часть пакета (она нам не нужна)
application.config['SECRET_KEY'] = 'i-could-bleed-for-a-smile-could-die-for-a-gun'


@application.route('/test_get', methods=['GET'])
def test_get():
    return {
        'user_id': uuid.uuid4().hex,
        'username': 'Vasya_Turnikman_228',
        'email': 'testmail@mail.ru',
        'age': 32,
        'weight': 89,
        'height': 186,
        'password': f'Test_password_{uuid.uuid4().hex}',
        'is_auth': True
    }


@application.route('/test_post/<user_id>', methods=['GET', 'POST'])
def test_post(user_id):
    print(user_id)
    return f'your uuid is - {user_id}'


if __name__ == '__main__':  # Создаем точку доступа
    port = int(os.environ.get("PORT", 5050))
    application.run(host='0.0.0.0', port=port, debug=False)  # Запускаем приложение без опции дебага
