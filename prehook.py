from database_handler import create_connection, close_connection, execute_query, create_statement_from_df
from logging_handler import show_error_message
from pandas_handler import dataframes_cleansed
from misc_handler import retrieve_sql_files
from lookups import ErrorHandling, SQLCommands, DestSchema, PrehookSteps
import os 

def execute_sql_folder_prehook(db_session, target_schema = DestSchema.DW_SCHEMA, sql_directory_path = SQLCommands.SQL_FOLDER):
    sql_files = None
    try:
        sql_files = retrieve_sql_files(sql_directory_path)
        for sql_file in sql_files:
            if '_prehook' in sql_file:
                with open(os.path.join(sql_directory_path.value,sql_file), 'r') as file:
                    sql_query = file.read() 
                    sql_query = sql_query.replace('target_schema', target_schema.value)
                    return_query = execute_query(db_session=db_session, query=sql_query)
                    print("Prehook SQL Commands were successfully executed!")
                    if not return_query == ErrorHandling.NO_ERROR:
                        raise Exception( f" {PrehookSteps.EXECUTE_SQL_COMMANDS.value} = SQL File Error on SQL file = " + str(sql_file))
    except Exception as e:
        show_error_message(ErrorHandling.PREHOOK_SQL_ERROR.value, str(e))
    finally:
        return sql_files 
    
def create_sql_staging_tables(db_session, target_schema):
    dataframes_dict  = dataframes_cleansed()
    print("Data cleaning and optimization is fully complete!")
    create_statements = {}

    for table_name, source_df in dataframes_dict.items():
        if source_df.empty:
            raise Exception(f"No DataFrame returned for table '{table_name}'")

        try:
            stg_table_name = f"stg_{table_name}"
            staging_df = source_df.head(1)
            columns = list(staging_df.columns)
            create_stmt = create_statement_from_df(staging_df, f"{target_schema.value}", stg_table_name)
            execute_return_val = execute_query(db_session=db_session, query=create_stmt)
            print("The create staging table statement was successfully executed!")
            if execute_return_val != ErrorHandling.NO_ERROR:
                raise Exception(f"{ErrorHandling.EXECUTE_QUERY_ERROR}: this error occured while creating the table!")
            create_sql_stg_table_idx(db_session, f"{target_schema.value}", stg_table_name, columns[0])
            print("Staging tables index was created!")
            create_statements[table_name] = create_stmt
        except Exception as e:
            show_error_message(ErrorHandling.ERROR_CREATING_STAGING_TABLE.value, str(e))
        
    return create_statements

def create_sql_stg_table_idx(db_session,source_name,table_name,index_val):
    try:
        query = f"CREATE INDEX IF NOT EXISTS idx_{table_name} ON {source_name}.{table_name} ({index_val});"
        execute_query(db_session,query)
    except Exception as e:
        show_error_message(PrehookSteps.CREATE_TABLE_IDX.value, str(e))

def execute_prehook(sql_directory_path = SQLCommands.SQL_FOLDER):
    step = None
    try:
        db_session = create_connection()
        execute_sql_folder_prehook(db_session,DestSchema.DW_SCHEMA,sql_directory_path)
        create_sql_staging_tables(db_session, DestSchema.DW_SCHEMA)
        close_connection(db_session)
    except Exception as e:
        error_prefix = f'{ErrorHandling.PREHOOK_SQL_ERROR.value}'
        show_error_message(error_prefix,str(e))