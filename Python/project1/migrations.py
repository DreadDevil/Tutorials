from flask_migrate import Migrate, upgrade
from app import create_app, db
from app.models import User, Table, UserTableAccess

app = create_app()
migrate = Migrate(app, db)

def init_db():
    with app.app_context():
        upgrade()

if __name__ == '__main__':
    init_db()
