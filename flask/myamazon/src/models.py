from flask_sqlalchemy import SQLAlchemy
db = SQLAlchemy()


class User(db.Model):
    __tablename__ = 'users'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(128), nullable=False)
    address = db.Column(db.String(300), nullable=True)
    email = db.Column(db.String(300), unique=True, nullable=False)
    phone = db.Column(db.String(20), nullable=True)

    def __init__(self, name: str, address: str, email: str, phone: str):
        self.name = name
        self.address = address
        self.email = email
        self.phone = phone

    def serialize(self):
        return {
            'id': self.id,
            'name': self.name,
            'address': self.address,
            'email': self.email,
            'phone': self.phone
        }


class Product(db.Model):
    __tablename__ = 'products'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(300), nullable=False)
    price = db.Column(db.Float(2), nullable=False)
    amountinstock = db.Column(db.Integer, nullable=False)


class Cart(db.Model):
    __tablename__ = 'carts'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)


class Payment(db.Model):
    __tablename__ = 'payments'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)
    cardnumber = db.Column(db.String(128), nullable=False)
    cardaddress = db.Column(db.String(300), nullable=False)


class Product_Cart(db.Model):
    __tablename__ = 'products_carts'
    product_id = db.Column(db.Integer, db.ForeignKey(
        'products.id'), primary_key=True, nullable=False)
    cart_id = db.Column(db.Integer, db.ForeignKey(
        'carts.id'), primary_key=True, nullable=False)
    count = db.Column(db.Integer, nullable=False)
