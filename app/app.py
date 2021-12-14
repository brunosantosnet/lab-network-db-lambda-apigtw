import psycopg2
import os
import json

print('Loading function')

def lambda_handler(event, context):
   conn = psycopg2.connect(
      database="postgres", user=os.getenv('db_instance_username'), password=os.getenv('db_master_password'), host=os.getenv('db_instance_address'), port=os.getenv('db_instance_port')
   )
   cursor = conn.cursor()
   cursor.execute("select version()")
   data = cursor.fetchone()
   print("Connection established to: ",data)
   return {
    'statusCode': 200,
    'body': json.dumps({'version': data})
   }
   conn.close()