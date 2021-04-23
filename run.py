# -*- coding: utf-8 -*-
# @Time    : 2021/4/22 16:36
# @Author  : chenkang19736
# @File    : run.py
# @Software: PyCharm

import os

import bottle
from bottle import Bottle, route, run, template

from mock.business.loadJsonFile import readJsonFile

mock = Bottle()

@mock.route("/")
def readMe():
    return template("""<h1>说明</h1>
    <p>该服务主要是解决三方服务环境不便利，可通过自行模拟配置三方服务的回参.</p>
    <h2>配置说明</h2>
    <p>代码的config目录下， 在response.json文件里面进行配置；json文件中的key为实际请求的接口url，value为接口的响应参数</p>
    <h3>样例</h3>
    <p>配置信息为：
    "chenk": {"name": "hello", "data": {"error_no": "0", "error_info": "nomal", "data_list": [1, 2, 3, 4]}}
    <br>则接口请求地址为 IP:PORT/mock/chenk(url中的mock是默认路由前缀)<br>
    响应内容为： {"name": "hello", "data": {"error_no": "0", "error_info": "nomal", "data_list": [1, 2, 3, 4]}}
    </p>
    """)

@mock.route('/mock/<name:path>')
def mockResponse(name):
    responseJson = readJsonFile("config/response.json")
    if name not in responseJson:
        return template("Sorry, the url you visit can't be matched in the file response.json.")
    return responseJson.get(name)


def hello(name="Stranger"):
    return template("Hello World! {{name}}, {{chenk}}", name="nima", chenk=name)

run(app=mock, host="localhost", port=8888, debug=False)