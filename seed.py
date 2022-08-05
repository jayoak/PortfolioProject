"""
Populate myamazon database with fake data using the SQLAlchemy ORM.
"""

import random
import string
import hashlib
import secrets
from faker import Faker
from myamazon_flask.src.models import User, Product, Cart, Payment, Product_Cart, db
from myamazon_flask.src import create_app

USER_COUNT = 4
PRODUCT_COUNT = 4
CART_COUNT = 4
PAYMENT_COUNT = 4
PRODUCTS_CARTS_COUNT = 11

#assert LIKE_COUNT <= (USER_COUNT * TWEET_COUNT)

userlist = [['apple', 'dd', 'apple@google.com', '000-000-0000'],
            ['bannana', 'dd', 'bannana@google.com', '000-000-0001'],
            ['cherry', 'dd', 'cherry@google.com', '000-000-0002'],
            ['durian', 'dd', 'durian@google.com', '000-000-0003']]

productlist = [['eggplants', '2.00', '100'],
               ['figs', '2.50', '100'],
               ['guavas', '3.00', '100'],
               ['hazelnuts', '3.05', '100']]

cartlist = [[1, 1], [2, 2], [3, 3], [4, 4]]

paymentlist = [[1, '2222-2222-2222', 'dd'],
               [2, '2222-2222-2223', 'dd'],
               [3, '2222-2222-2224', 'dd'],
               [4, '2222-2222-2225', 'dd']]

products_carts_list = [[1, 1, 2],
                       [2, 1, 2],
                       [3, 1, 2],
                       [4, 1, 10],
                       [1, 2, 2],
                       [2, 2, 2],
                       [4, 2, 10],
                       [1, 3, 3],
                       [2, 3, 5],
                       [3, 3, 5],
                       [4, 3, 12]]


def random_passhash():
    """Get hashed and salted password of length N | 8 <= N <= 15"""
    raw = ''.join(
        random.choices(
            string.ascii_letters + string.digits + '!@#$%&',  # valid pw characters
            k=random.randint(8, 15)  # length of pw
        )
    )

    salt = secrets.token_hex(16)

    return hashlib.sha512((raw + salt).encode('utf-8')).hexdigest()


def truncate_tables():
    """Delete all rows from database tables"""
    # db.session.execute(Product_Cart.delete())
    Product_Cart.query.delete()
    Payment.query.delete()
    Cart.query.delete()
    Product.query.delete()
    User.query.delete()
    db.session.commit()


def main():
    """Main driver function"""
    app = create_app()
    app.app_context().push()
    truncate_tables()
    fake = Faker()

    last_user = None  # save last user
    for x in range(len(userlist)):
        last_user = User(
            name=userlist[x][0],
            address=userlist[x][1],
            email=userlist[x][2],
            phone=userlist[x][3]
        )
        db.session.add(last_user)
    # insert users
    db.session.commit()

    last_product = None  # save last product
    for x in range(len(productlist)):
        last_product = Product(
            name=productlist[x][0],
            price=productlist[x][1],
            amountinstock=productlist[x][2]
        )
        db.session.add(last_product)
    # insert products
    db.session.commit()

    last_cart = None  # save last cart
    for x in range(len(cartlist)):
        last_cart = Cart(
            user_id=cartlist[x][0]
        )
        db.session.add(last_cart)
    # insert carts
    db.session.commit()

    last_payment = None  # save last payment
    for x in range(len(paymentlist)):
        last_payment = Payment(
            user_id=paymentlist[x][0],
            cardnumber=paymentlist[x][1],
            cardaddress=paymentlist[x][2]
        )
        db.session.add(last_payment)
    # insert payment
    db.session.commit()

    last_products_carts = None  # save last products_carts
    for x in range(len(products_carts_list)):
        last_products_carts = Product_Cart(
            product_id=products_carts_list[x][0],
            cart_id=products_carts_list[x][1],
            count=products_carts_list[x][2]
        )
        db.session.add(last_products_carts)

    # insert products_carts
    db.session.commit()


# run script
main()
