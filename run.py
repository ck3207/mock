# -*- coding: utf-8 -*-
# @Time    : 2021/4/22 16:36
# @Author  : chenkang19736
# @File    : run.py
# @Software: PyCharm

import os, time


from bottle import Bottle, request, run, template, static_file, FileUpload
from business.loadJsonFile import readJsonFile
from public import logging


def getCurrentTime():
    return time.strftime("%Y-%m-%d_%H%M%S")


mock = Bottle()

@mock.route("/")
@mock.route("/readMe")
def readMe2():
    return template("bootstrap.html.tpl")


@mock.route("/mock/fetchResponseJsonFile")
def fetchResponseJsonFile():
    result = ""
    for k, v in readJsonFile("config/response.json").items():
        result += "<p>{0}: {1}</p>".format(k, v)
    return result


@mock.route('/mock/<name:path>')
def mockResponse(name):
    responseJson = readJsonFile("config/response.json")
    if name not in responseJson:
        return template("Sorry, the url you visit can't be matched in the file response.json.")
    return responseJson.get(name)


@mock.route("/mock/downloadResponseJsonFile")
def downloadResponseJsonFile(filename="response.json"):
    print("os.getcwd", os.getcwd())
    path = os.path.join(os.getcwd(), "config")
    print(path)
    return static_file(filename, root=path, download=filename)


@mock.route("/mock/uploadResponseJsonFile", method="POST")
def uploadResponseJsonFile():
    category = request.forms.get('category')
    upload = request.files.get('upload')
    name, ext = os.path.splitext(upload.filename)
    if ext not in (".json"):
        return 'File extension not allowed.'

    try:
        filepath = os.path.join(os.getcwd(), "config", "response.json")
        backupFilepath = "-".join([filepath, getCurrentTime()])
        os.renames(filepath, backupFilepath)
        upload.save(destination=filepath) # appends upload.filename automatically
    except Exception as e:
        logging.info(str(e))
        logging.info("The origin filepath is {}.".format(filepath))
        logging.info("The backup filepath is {}.".format(backupFilepath))
        return str(e)
    return 'Upload Succefully!'


def hello(name="Stranger"):
    return template("Hello World! {{name}}, {{chenk}}", name="nima", chenk=name)

run(app=mock, host="localhost", port=8889, debug=True, reloader=True)