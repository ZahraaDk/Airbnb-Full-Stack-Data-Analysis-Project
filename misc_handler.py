import os 
from lookups import SQLCommands

def retrieve_sql_files(sql_command_path = SQLCommands.SQL_FOLDER):
    sql_files = [file for file in os.listdir(sql_command_path.value) if file.endswith('.sql')]
    sorted_sql_files = sorted(sql_files)
    return sorted_sql_files
