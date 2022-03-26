import shutil
import subprocess
import os

path_to_jar = "/home/pi/minecraft-server/getoffmylawn_v2/"
active_jar = "server.jar"
update_jar = "paper_update.jar"
rename_to_temp_jar = "last_server_version.jar"
minecraft_service = "minecraft@getoffmylawn_v2"

status = subprocess.call(['systemctl', 'is-active', "--quiet", minecraft_service])

if status == "0":
    subprocess.call(['sudo', 'systemctl', 'stop', 'minecraft@getoffmylawn_v2'])
else:
    pass

active_jar_path = path_to_jar + active_jar
rename_active_path = path_to_jar + rename_to_temp_jar
update_jar_path = path_to_jar + update_jar
rename_update_path = path_to_jar + active_jar

if os.path.isfile(path_to_jar + active_jar):
    # Clean up any stale temp jars only if we have an active jar
    if os.path.isfile(path_to_jar + rename_to_temp_jar):
        os.remove(path_to_jar + rename_to_temp_jar)

os.rename(active_jar_path, rename_active_path)  # Renames the active jar to a temporary name
os.rename(update_jar_path, rename_update_path)  # Renames the update jar to the active jar name