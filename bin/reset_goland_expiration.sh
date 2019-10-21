
#echo "removing evaluation key"
#rm  -rf ~/.GoLand*/config/eval

rm -rf ~/.java/.userPrefs/jetbrains/goland

echo "resetting evalsprt in options.xml"
sed -i '/evlsprt/d' ~/.GoLand*/config/options/options.xml

echo "resetting evalsprt in prefs.xml"
sed -i '/evlsprt/d' ~/.java/.userPrefs/prefs.xml

echo "change date file"
find ~/.GoLand* -type d -exec touch -t $(date +"%Y%m%d%H%M") {} +;
find ~/.GoLand* -type f -exec touch -t $(date +"%Y%m%d%H%M") {} +;
