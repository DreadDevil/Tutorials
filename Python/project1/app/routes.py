from flask import Blueprint, jsonify, request
from flask_login import login_required, current_user
from app import db
from app.models import Table, UserTableAccess

bp = Blueprint('main', __name__)

@bp.route('/api/tables', methods=['GET'])
@login_required
def get_tables():
    user_access = UserTableAccess.query.filter_by(user_id=current_user.id).all()
    tables = [{'id': access.table.id, 'name': access.table.name, 'access_level': access.access_level}
              for access in user_access if access.access_level != 'none']
    return jsonify(tables)

@bp.route('/api/table/<int:table_id>', methods=['GET', 'POST'])
@login_required
def handle_table(table_id):
    access = UserTableAccess.query.filter_by(user_id=current_user.id, table_id=table_id).first()
    if not access or access.access_level == 'none':
        return jsonify({'message': 'Access denied'}), 403

    if request.method == 'GET':
        # Logic to retrieve table data
        return jsonify({'table_data': 'Table data here'})
    elif request.method == 'POST':
        if access.access_level != 'edit':
            return jsonify({'message': 'Edit access required'}), 403
        # Logic to update table data
        return jsonify({'message': 'Table updated successfully'})

# Add more routes as needed
