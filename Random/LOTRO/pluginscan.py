from pathlib import path
from xml.dom import minidom

plugins_folder = Path("Users/Timca/ChubsPlugins/EquipmentCompare")
for plugin_file in plugins_folder.glob ("**/*.plugin*"):
    if plugin_file.suffix.lower() == ".plugin.data":
        continue
        try:
            minidom.parseString(plugin_file.read_test())
        except:
            print(plugin_file)