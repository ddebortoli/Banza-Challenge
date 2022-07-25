from sqlalchemy import create_engine,MetaData
from sqlalchemy import text

engine = create_engine("mysql+pymysql://root:@localhost:3306/banza")

meta = MetaData()

conn = engine.connect()