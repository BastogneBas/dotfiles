if [ "$1" == "m" ]
then
	swaymsg 'output "Sharp Corporation 0x1476 0x00000000" scale 2.5'
	swaymsg 'output "Goldstar Company Ltd LG Ultra HD 0x0000A3BA" pos 1536 446 scale 1'
	swaymsg 'output "Samsung Electric Company SyncMaster HMBB903933" pos 5376 1406'
	swaymsg 'bindsym XF86Launch1 exec /home/bas/.config/sway/changeDisplayScale.sh s'
elif [ "$1" == "s" ]
then
	swaymsg 'output "Sharp Corporation 0x1476 0x00000000" scale 1.875'
	swaymsg 'output "Goldstar Company Ltd LG Ultra HD 0x0000A3BA" pos 2048 446 scale 1'
	swaymsg 'output "Samsung Electric Company SyncMaster HMBB903933" pos 5888 1406'
	swaymsg 'bindsym XF86Launch1 exec /home/bas/.config/sway/changeDisplayScale.sh m'
fi
