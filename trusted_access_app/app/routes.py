from flask import render_template, request, redirect, url_for, flash
from . import db
from .models import users, trusted_access, login_details, transactions
from flask import current_app as app

@app.route('/')
def index():
    return render_template('login.html')

@app.route('/login', methods=['POST'])
def login():
    email = request.form['email']
    password = request.form['password']
    user = users.query.filter_by(email=email, password=password).first()
    print(user.first_name)
    if user:
        # Add a login record
        new_login = login_details(user_id=user.user_id, device_info=request.headers.get('users-Agent'))
        db.session.add(new_login)
        db.session.commit()
        return redirect(url_for('dashboard', user_id=user.user_id))
    flash('Invalid credentials')
    return redirect(url_for('index'))

@app.route('/dashboard/<int:user_id>')
def dashboard(user_id):
    user = users.query.get(user_id)
    if not user:
        return redirect(url_for('index'))
    transaction = transactions.query.filter_by(user_id=user_id).all()
    return render_template('dashboard.html', user=user, transactions=transaction)

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        name = request.form['name']
        new_user = users(email=email, password=password, name=name)
        db.session.add(new_user)
        db.session.commit()
        return redirect(url_for('index'))
    return render_template('register.html')

@app.route('/transaction', methods=['POST'])
def transaction():
    user_id = request.form['user_id']
    amount = request.form['amount']
    transaction_type = request.form['transaction_type']
    description = request.form['description']

    new_transaction = transactions(
        user_id=user_id,
        amount=amount,
        transaction_type=transaction_type,
        description=description
    )
    db.session.add(new_transaction)
    db.session.commit()
    return redirect(url_for('dashboard', user_id=user_id))
