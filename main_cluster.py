import yaml
import os



with open('config/config_main.yaml') as yamlfile :
    config = yaml.load(yamlfile, Loader = yaml.BaseLoader)

project = config["PROJECT"]
metadata_path = config["METAFILE"]
result_path = config["RESULTPATH"]
njobs = config["NJOBS"]
hardware = config["HARDWARE"]


#check that the configuration files are valid
try :
    assert(os.path.exists(metadata_path))
except Exception as err :
    print("It seems that the given metadata path does not exists", err)

try :
    assert(hardware in ["local", "iPOP-UP", "IFB"])
except :
    print("It seems the HARDWARE part of configuration does not match expectation")
