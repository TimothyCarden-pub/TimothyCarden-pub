from pathlib import Path
from xml.dom import minidom

# Corrected path: make sure it points to the right folder
plugins_folder = Path("C:/Users/Timca/ChubsPlugins/EquipmentCompare")

# Loop through .plugin files
for plugin_file in plugins_folder.glob("**/*.plugin*"):
    if plugin_file.suffix.lower() == ".plugin.data":
        continue
    try:
        # Correct method for reading text content
        minidom.parseString(plugin_file.read_text())
    except Exception as e:
        # Print the file name and exception for debugging
        print(f"Error parsing {plugin_file}: {e}")
