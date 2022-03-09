## pip3 install minio でモジュールをインストールしておいてください.
from minio import Minio
import urllib3

## 自己証明書を使っている場合の警告を非表示にする.
from urllib3.exceptions import InsecureRequestWarning
urllib3.disable_warnings(InsecureRequestWarning)

## 自己証明書のため検証を無効化とする.
http_client = urllib3.PoolManager(
  cert_reqs = 'CERT_NONE',
  assert_hostname=False,
)

client = Minio(
  endpoint = '192.168.0.128:9000',
  access_key = 'minioAdminUser',
  secret_key = 'minioAdminPassword',
  secure=True,
  http_client=http_client
)
bucket_name = "sample-bucket"
found = client.bucket_exists(bucket_name)
if not found:
  print("Not found")
  exit()

## ファイルをダウンロード.
objects = client.list_objects(bucket_name)
for obj in objects:
  name = obj.object_name
  print(name)
  client.fget_object(
    bucket_name = bucket_name,
    object_name = name,
    file_path = name )
