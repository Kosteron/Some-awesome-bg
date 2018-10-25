#!bin/bash
THEME_DIR="themes"
WORK_DIR="."
FULL_PATH=$WORK_DIR/some-awesome-bg
DEPENDANCIES=('devilspie' 'xdotool')
DEBUG=false
INDEX_HTML_PATH="file://${PWD}/index.html"
NATIVEFIER_JSON_PATH="${PWD}/resources/app/nativefier.json"

function show_banner {
clear
echo "
-------------------------------------------------------------
- Stellae                                                   -
-------------------------------------------------------------
"
}

function is_chromium_conf_applyed {
	if [ "$DEBUG" = true ]; then echo "rewriting of the nativefier json file"; echo "INDEX_HTML_PATH=${INDEX_HTML_PATH}"; echo "NATIVEFIER_JSON_PATH=${NATIVEFIER_JSON_PATH}"; fi
	rm $WORK_DIR/temp_conf.json	
	echo '{
	    "name": "some-awesome-bg", "targetUrl": "'${INDEX_HTML_PATH}'", "counter": false, "bounce": false, "width": 1280, "height": 800, "showMenuBar": false, "fastQuit": false, "userAgent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36", "nativefierVersion":"7.6.7", "ignoreCertificate":true, "disableGpu":false, "ignoreGpuBlacklist":false, "enableEs3Apis":false, "insecure":true, "flashPluginDir":null, "diskCacheSize":null, "fullScreen":false, "maximize":true, "zoom":1, "internalUrls":null, "singleInstance":false, "win32metadata": {
		"ProductName": "SomeAwesomeBG", "InternalName": "SomeAwesomeBG", "FileDescription": "SomeAwesomeBG"
	    }
	    ,
	    "tray":false,
	    "basicAuthUsername":null,
	    "basicAuthPassword":null,
	    "alwaysOnTop":false,
	    "titleBarStyle":null
	}' | tee $WORK_DIR/temp_conf.json &> /dev/null
	# cp -rvf...
	yes | cp -rf $WORK_DIR/temp_conf.json $NATIVEFIER_JSON_PATH
}

function is_devilspie_conf_applyed {
	echo '(if(matches (window_name) "Stellae")(begin(set_workspace 0)(below)(undecorate)(skip_pager)(skip_tasklist)(wintype "utility")(geometry "+50+50")(geometry "1366x768")(maximize)))' | tee $WORK_DIR/temp_devilspie.ds &> /dev/null
	mkdir ~/.devilspie &> /dev/null
	yes | cp -rf $WORK_DIR/temp_devilspie.ds ~/.devilspie/DesktopStellae.ds
}

function is_package_installed {
for index in ${!DEPENDANCIES[@]}; do
	if [ "$DEBUG" = true ]; then echo "$index - Check if installed : ${DEPENDANCIES[$index]}"; fi
	if [ $(dpkg-query -W -f='${Status}' ${DEPENDANCIES[$index]} 2>/dev/null | grep -c "ok installed") -eq 0 ];then 
		if [ "$DEBUG" = true ]; then echo "Error ${DEPENDANCIES[$index]} is not installed"; fi
		return 1;
	fi
done
if [ "$DEBUG" = true ]; then echo "All package are already installed [ OK ]"; fi
}

# start function for chromium and background function
function start_chromium {
	if [[ $(pgrep -cl devilspie) -ge 1 ]]; then
		if [ "$DEBUG" = true ]; then echo 'An devilspie instance for stellae is already running. Try to kill it.'; fi
		pkill devilspie
	else
		if [ "$DEBUG" = true ]; then echo "Devilspie isn't running we launch it"; fi
		$FULL_PATH &>/dev/null &
		if [ "$DEBUG" = true ]; then echo 'Waiting for chromium'; fi		
		sleep 1.5	
		echo 'Launching Stellae Wallpaper'
		devilspie &>/dev/null &
		sleep 0.5	
		pkill devilspie
		if [ "$DEBUG" = true ]; then echo 'Refresh Chromium'; fi
		key='ctrl+r'
		interact_chromium
	fi
}

# Interact with chromium via xdotool
function interact_chromium {
	xdotool windowactivate $(xdotool search --onlyvisible --class some-awesome-bg|head -1) && xdotool key $key
}

# fetch all preset on $THEME_DIR (default ./themes")
function fetch_preset {
	i=0
	while read line
	do
	    array[ $i ]="$line"        
	    (( i++ ))
	done < <(ls $THEME_DIR/)
}

# show all preset to the user
function show_preset {
	show_banner
	fetch_preset
	if [ "$DEBUG" = true ]; then echo "Number of directory detected : ${#array[@]}"; fi
	echo "Number of preset available :"
	for index in ${!array[@]}; do
		echo "$index - ${array[$index]}"
	done
	set_preset
}

function set_preset {
	echo "Choose your preset >"
	read choice
	echo "Choice - ${array[$choice]}"
	# Concatenate path
	FILE_PATH=$( echo "$FILE_PATH" | sed 's/ /\\ /g' )
	# Copy the file
	echo $path
	yes | cp -rfv "./$THEME_DIR/${array[$choice]}/"* $WORK_DIR
	# Refresh chromium
	key='ctrl+r'
	interact_chromium && echo "Applying preset : [ OK ]"
}

function show_help {
show_banner
echo "Type '${0} start'	for run Stellae Wallpaper
Type '${0} stop'	for stop Stellae Wallpaper
Type '${0} preset	for a detailled config menu
Type '${0} help	show this help
"
}

### main		-----------------------------------------------------------------
is_chromium_conf_applyed
is_devilspie_conf_applyed
is_package_installed
case "$1" in
	start) 
		echo "Chromium start"
		start_chromium
	;;
	stop) 
		echo "Chromium stop"
		key='alt+F4'
		interact_chromium
	;;
	preset) 
		if [ "$DEBUG" = true ]; then echo "Preset Selection"; fi
		show_preset
	;;
	help) 
		show_help
	;;
	*)
		echo "Type ${0} help for more information"	
	;;
esac