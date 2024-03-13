import select
import sqlite3
import uuid
import json

import sqlalchemy.exc
from sqlalchemy import *
from DataBase import Users, UserData, engine, Session


DataBase = sqlite3.connect('main.db', check_same_thread=False)
cursor = DataBase.cursor()


def data_extractor(req_column, where_state=False, com_stmt='', comp_to='', to_array=False):
    result_arr = []
    if where_state:
        stmt = select(req_column).where(com_stmt == comp_to)
        with engine.connect() as conn:
            if to_array:
                for row in conn.execute(stmt):
                    result_arr.append([*row])
                return result_arr
            else:
                for row in conn.execute(stmt):
                    return row[0]
    else:
        stmt = select(req_column)
        with engine.connect() as conn:
            if to_array:
                for row in conn.execute(stmt):
                    result_arr.append([*row])
                return result_arr
            else:
                for row in conn.execute(stmt):
                    return row[0]


def add_new_user(data):
    assert list(data['username']) not in data_extractor(Users.username, to_array=True), 'Пользователь с данным именем уже создан'
    assert list(data['email']) not in data_extractor(Users.email, to_array=True), 'Пользователь с этой почтой уже существует'
    try:
        new_user = Users(
            username=data['username'],
            email=data['email'],
            password=data['password'],
        )
        session_db = Session()  # Выполняем запись в бд
        session_db.add(new_user)
        session_db.commit()
    except sqlalchemy.exc.IntegrityError:
        return False
    return True

