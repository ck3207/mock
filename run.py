# -*- coding: utf-8 -*-
# @Time    : 2021/4/22 16:36
# @Author  : chenkang19736
# @File    : run.py
# @Software: PyCharm

import os

from bottle import route, run, template

from mock.business.loadJsonFile import readJsonFile

@route("/")
@route('/mock/<name>')
def hello(name="Stranger"):
    return template("Hello World! {{name}}", name=name)

run(host="localhost", port=8888, debug=True)