import dlt
import pandas as pd
import yaml
import urllib.request
import json

filePath = ("{1}")
if({5}):
    with urllib.request.urlopen(filePath) as file:
        loaded_data = yaml.safe_load(file)
    if isinstance(loaded_data, list):
        df = pd.DataFrame(loaded_data)
    elif isinstance(loaded_data, dict):
        df = pd.json_normalize(loaded_data)
elif({8}):
    with open("{1}") as f:
        json_data = json.load(f)
    if isinstance(json_data, list):
        df = pd.DataFrame(json_data)
    else:
        df = pd.DataFrame.from_dict(json_data, orient='index')
else:
    df = pd.{2}(filePath{4})
data = df.to_dict(orient="records")

pipeline = dlt.pipeline(
    pipeline_name="{0}_pipeline",
    destination='{6}',
    staging={7},
    dataset_name="{0}",
)
load_info = pipeline.run(data, table_name="{3}")

print(load_info)