import os

from typing import List
from kitty.utils import reload_conf_in_all_kitties
from kitty.config import load_config
from kitty.constants import config_dir

def main(args: List[str]):
    is_darkmode = os.environ.get("DARKMODE") == "1"
    # TODO: drive this from the config
    theme = "Brogrammer" if is_darkmode else "ayu_light"
    os.system(f"ln -f -s {config_dir}/themes/{theme}.conf {config_dir}/theme.conf")
    reload_conf_in_all_kitties()
