from bottle import Bottle, route, run, get, post, error

app = Bottle()

@route('/hello/<name>')
def hello(name):
    return "hello {}".format(name)


@app.route('/greet/<name>')
def hello(greet, name):
    return "welcome to {1}".format(name)

@app.route('/demo2/<greet:re:\w+>/<count:int>')
def hello(greet, count):
    out = ""
    for i in range(count):
        out += "Say '{0}' {1} times.<br>".format(greet, i+1)
    return out


# @get('/demo3/<count:int>')
# def hello(count):
#     out = ""
#     for i in range(count):
#         out += "Say '{0}'times.<br>".format(i+1)
#     return out

@app.route('/hello', method='GET')
def hello():
    return "Hello, everybody."


@get('/hi')
def hi():
    return "Hi, everybody."


@error(404)
def errro404():
    return "404, Please Check."

if __name__ == "__main__":
    run(app=app, host="localhost", port=8888, debug=True)
