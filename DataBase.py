import sqlite3  # импорт движка базы данных
from flask_login import UserMixin, login_manager, LoginManager

from sqlalchemy.orm import declarative_base, sessionmaker  # Импортируем необходимые модули дял сборки базы данных
from sqlalchemy import create_engine  # модуль который и будет производить сборку
from sqlalchemy import Column, Integer, String, ForeignKey, Date, Boolean  # Типы данных для бд
from sqlalchemy import Sequence

Base = declarative_base()  # Создаем экземпляр класса declarative_base
engine = create_engine('sqlite:///trainer.db', echo=False)  # Генерим базу данных
Session = sessionmaker(bind=engine)  # Экземпляр класса сессий


class Users(Base, UserMixin):
    __tablename__ = 'users'
    id = Column(Integer, Sequence('user_id_seq'), primary_key=True, unique=True)
    username = Column(String(80), nullable=False, unique=True)
    email = Column(String(80), nullable=False)
    age = Column(Integer, nullable=False)
    weight = Column(Integer, nullable=False)
    height = Column(Integer, nullable=False)
    password = Column(String(16), nullable=False)
    is_auth = Column(Boolean, nullable=False)

    def __repr__(self):
        return f'<User (user name = {self.username}, email = {self.email})>'


class UserData(Base):
    __tablename__ = 'records'
    record_id = Column(Integer, Sequence('record_id_seq'), primary_key=True, unique=True)
    user_id = Column(Integer, ForeignKey('users.id'), nullable=False)
    best_try = Column(Integer, nullable=True)
    current_try = Column(Integer, nullable=True)
    best_try_time = Column(String(26), nullable=False)
    current_try_time = Column(String(26), nullable=False)
    # Надо подумать что еще можно добавить в записи об упражнениях

    def __repr__(self):
        return f'File (record name = {self.record_id} owner = {self.user_id})'


Base.metadata.create_all(engine)  # Создаем движок для работы с бд и создаем саму бд