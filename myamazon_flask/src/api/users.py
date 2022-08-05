from flask import Blueprint, jsonify, abort, request, Flask
from ..models import User, Product, Cart, Payment, Product_Cart, db

#app = Flask(__name__)
bp = Blueprint('users', __name__, url_prefix='/users')
bp2 = Blueprint('home', __name__, url_prefix='/')

#@app.route('/')
#def hello_world():
#    return 'My Ecommerce!'

@bp2.route('/', methods=['GET'])
def hello_world1():
    return f'My Ecommerce!!'

@bp.route('', methods=['GET'])  # decorator takes path and list of HTTP verbs
def users():
    users = User.query.all()  # ORM performs SELECT query
    result = []
    for t in users:
        result.append(t.serialize())  # build list of Tweets as dictionaries
    return jsonify(result)  # return JSON response


@bp.route('/<int:id>', methods=['GET'])
def show_user(id: int):
    t = User.query.get_or_404(id)
    return jsonify(t.serialize())


@bp.route('/<int:id>', methods=['PATCH', 'PUT'])
def update(id: int):
    t = User.query.get_or_404(id)
    # check if name was passed
    if 'name' in request.json:
        # update the name
        t.name = request.json['name']

    # check if address was passed
    if 'address' in request.json:
        # update the address
        t.address = request.json['address']

    # check if email was passed
    if 'email' in request.json:
        # update the email
        t.email = request.json['email']

    # check if phone was passed
    if 'phone' in request.json:
        # update the phone
        t.phone = request.json['phone']

    try:
        # db.session.add(t) # prepare update statement
        db.session.commit()  # execute update statement
        return jsonify(t.serialize())
    except:
        # something went wrong :(
        return jsonify(False)


@bp.route('', methods=['POST'])
def create():
    # req body must contain name and email
    if 'name' not in request.json or 'email' not in request.json:
        return abort(400)
    # construct user
    t = User(
        name=request.json['name'],
        email=request.json['email'],
        address = "",
        phone ="")

    if 'address' in request.json:
        t.address = request.json['address']
    if 'phone' in request.json:
        t.phone = request.json['phone']

    db.session.add(t)  # prepare CREATE statement
    db.session.commit()  # execute CREATE statement
    return jsonify(t.serialize())


@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    t = User.query.get_or_404(id)
    try:
        db.session.delete(t)  # prepare DELETE statement
        db.session.commit()  # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)
