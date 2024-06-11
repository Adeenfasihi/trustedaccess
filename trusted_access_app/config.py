# class Config:
#     SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://<DB_USER>:<DB_PASSWORD>@<DB_HOST>/<DB_NAME>'
#     SQLALCHEMY_TRACK_MODIFICATIONS = False
#     SECRET_KEY = 'your_secret_key'

class Config:
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://dev_user:password@34.147.221.37/reboot2024'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SECRET_KEY = 'your_secret_key'
