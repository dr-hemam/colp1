"""empty message

Revision ID: 9f00a5849e88
Revises: None
Create Date: 2017-06-09 05:01:58.500460

"""

# revision identifiers, used by Alembic.
revision = '9f00a5849e88'
down_revision = None

from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import mysql

def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_unique_constraint(None, 'constraintanalysis_details', ['id'])
    op.add_column('constraints', sa.Column('project_id', sa.Integer(), nullable=True))
    op.create_unique_constraint('uix_cnst1', 'constraints', ['name', 'project_id'])
    op.drop_constraint('constraints_ibfk_1', 'constraints', type_='foreignkey')
    op.create_foreign_key(None, 'constraints', 'projects', ['project_id'], ['id'])
    op.drop_column('constraints', 'org_id')
    op.drop_column('delay_reasons', 'org_id')
    op.create_unique_constraint('uix_org1', 'organisations', ['code', 'name'])
    op.drop_index('code', table_name='organisations')
    op.create_unique_constraint('uix_prj1', 'projects', ['code', 'org_id'])
    op.create_unique_constraint('uix_rc1', 'reportingcycles', ['code', 'organisation_id'])
    op.drop_index('code', table_name='reportingcycles')
    op.create_unique_constraint('uix_rol1', 'roles', ['name', 'organisation_id'])
    op.create_unique_constraint('uix_sec1', 'sections', ['code', 'project_id'])
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint('uix_sec1', 'sections', type_='unique')
    op.drop_constraint('uix_rol1', 'roles', type_='unique')
    op.create_index('code', 'reportingcycles', ['code'], unique=True)
    op.drop_constraint('uix_rc1', 'reportingcycles', type_='unique')
    op.drop_constraint('uix_prj1', 'projects', type_='unique')
    op.create_index('code', 'organisations', ['code'], unique=True)
    op.drop_constraint('uix_org1', 'organisations', type_='unique')
    op.add_column('delay_reasons', sa.Column('org_id', mysql.INTEGER(display_width=11), autoincrement=False, nullable=True))
    op.add_column('constraints', sa.Column('org_id', mysql.INTEGER(display_width=11), autoincrement=False, nullable=True))
    op.drop_constraint(None, 'constraints', type_='foreignkey')
    op.create_foreign_key('constraints_ibfk_1', 'constraints', 'organisations', ['org_id'], ['id'])
    op.drop_constraint('uix_cnst1', 'constraints', type_='unique')
    op.drop_column('constraints', 'project_id')
    op.drop_constraint(None, 'constraintanalysis_details', type_='unique')
    # ### end Alembic commands ###
