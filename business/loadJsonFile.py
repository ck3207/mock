# -*- coding: utf-8 -*-
# @Time    : 2021/4/22 16:52
# @Author  : chenkang19736
# @File    : loadJsonFile.py
# @Software: PyCharm

import json

def readJsonFile(filepath):
    """读取json文件， 返回json对象"""
    json_obj = ""
    with open(file=filepath, mode="r", encoding="utf-8") as f:
        return json.loads(f.read())


def readStaticFile():
    pass


# a = readJsonFile("../config/response.json")
# print(a["data"])