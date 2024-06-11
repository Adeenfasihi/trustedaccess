from . import db
from sqlalchemy.dialects.mysql import BIGINT

class users(db.Model):
    __tablename__ = 'users'

    user_id = db.Column(BIGINT(unsigned=True), primary_key=True, autoincrement=True)
    email = db.Column(db.String(255), unique=True, nullable=False)
    password = db.Column(db.String(255), nullable=False)
    first_name = db.Column(db.String(255), nullable=False)
    last_name = db.Column(db.String(255), nullable=False)
    account_number = db.Column(BIGINT(unsigned=True), unique=True, nullable=False)
    account_balance = db.Column(db.Float, nullable=False)
    created_at = db.Column(db.DateTime, default=db.func.current_timestamp())

class trusted_access(db.Model):
    __tablename__ = 'trusted_access'

    trust_id = db.Column(BIGINT(unsigned=True), unique=True, autoincrement=True)
    user_id = db.Column(BIGINT(unsigned=True), db.ForeignKey('users.user_id'), nullable=False)
    trusted_user_id = db.Column(BIGINT(unsigned=True), db.ForeignKey('users.user_id'), nullable=False)
    access_level = db.Column(db.Enum('none', 'view', 'partial', 'full'), nullable=False)

    __table_args__ = (
    db.PrimaryKeyConstraint(
        user_id, trusted_user_id,
        ),
    )

class login_details(db.Model):
    __tablename__ = 'login_details'

    login_id = db.Column(BIGINT(unsigned=True), primary_key=True)
    user_id = db.Column(BIGINT(unsigned=True), db.ForeignKey('users.user_id'), nullable=False)
    login_time = db.Column(db.DateTime, default=db.func.current_timestamp())
    logout_time = db.Column(db.DateTime)
    device_info = db.Column(db.Text)

class transactions(db.Model):
    __tablename__ = 'transactions'

    transaction_id = db.Column(BIGINT(unsigned=True), primary_key=True, autoincrement=True)
    user_id = db.Column(BIGINT(unsigned=True), db.ForeignKey('users.user_id'), nullable=False)
    amount = db.Column(db.Float, nullable=False)
    transaction_type = db.Column(db.Enum('deposit', 'withdrawal', 'transfer'), nullable=False)
    timestamp = db.Column(db.DateTime, default=db.func.current_timestamp())
    description = db.Column(db.String(255))
