import yaml

def read_config(filename):
    with open(filename, 'r') as f:
        return yaml.load(f)