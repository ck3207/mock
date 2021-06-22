# -*- coding: utf-8 -*-
# @Time    : 2021/4/22 16:36
# @Author  : chenkang19736
# @File    : run.py
# @Software: PyCharm

import os, time


from bottle import Bottle, request, run, template, static_file, FileUpload, redirect, abort
from business.loadJsonFile import readJsonFile
from public import logging


def getCurrentTime():
    return time.strftime("%Y-%m-%d_%H%M%S")


mock = Bottle()

@mock.route("/")
@mock.route("/readMe")
def readMe():
    return template("index.html")

@mock.route("/static/<filename:path>")
def fetchStaticFile(filename, targetDir=""):
    if ".." in filename or ("static" in filename and os.path.basename(filename)):
        abort(403)
    path = os.path.join(os.getcwd(), targetDir, filename)
    if os.path.isfile(path):
        if not request.query.isDownload == "0":
            isDownload = True
        else: isDownload = False
    else:
        abort(404, text="{} is not exists.".format(os.path.join(os.getcwd(), targetDir, filename)))
    return static_file(filename=os.path.basename(filename), root=os.path.dirname(path), download=isDownload)

# @mock.route("/mock/downloadResponseJsonFile")
# def downloadResponseJsonFile(filename="response.json"):
#     print("os.getcwd", os.getcwd())
#     path = os.path.join(os.getcwd(), "config")
#     return static_file(filename, root=path, download=filename)


@mock.route("/mock/fetchResponseJsonFile")
def fetchResponseJsonFile():
    result = ""
    for k, v in readJsonFile("config/response.json").items():
        result += "<p>{0}: {1}</p>".format(k, v)
    return result


@mock.route('/mock/<name:path>', method=["GET", "POST", "OPTIONS"])
def mockResponse(name):
    responseJson = readJsonFile("config/response.json")
    if name not in responseJson:
        return template("Sorry, the url you visit can't be matched in the file response.json.")
    return responseJson.get(name)


@mock.route("/mock/downloadResponseJsonFile")
def downloadResponseJsonFile(filename="response.json"):
    print("os.getcwd", os.getcwd())
    path = os.path.join(os.getcwd(), "config")
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

template("{{o}}, {{name}}, {{name2}}", name="nihao", name2="chenk", o="imo")
run(app=mock, host="localhost", port=8889, debug=True, reloader=True, server="paste")
# run(app=mock, host="10.20.18.174", port=8889, debug=True, reloader=True)