# Disable recently used files in Engrampa Archive Manager
rm ~/.local/share/recently-used.xbel
touch ~/.local/share/recently-used.xbel
sudo chattr +i ~/.local/share/recently-used.xbel
