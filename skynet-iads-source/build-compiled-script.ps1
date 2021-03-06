if (Test-Path skynet-iads-compiled.lua) {
	Remove-Item skynet-iads-compiled.lua
}
Add-Content tmp-time.lua ("env.info(`"--- SKYNET VERSION: 1.1.0 | BUILD TIME: "+(Get-Date -date (Get-Date).ToUniversalTime()-uformat "%d.%m.%Y %H%MZ")+" ---`")")  
cat skynet-iads-supported-types.lua, skynet-iads.lua, skynet-mooose-a2a-dispatcher-connector.lua, skynet-iads-table-delegator.lua, skynet-iads-abstract-dcs-object-wrapper.lua, skynet-iads-abstract-element.lua, skynet-iads-abstract-radar-element.lua, skynet-iads-awacs-radar.lua, skynet-iads-command-center.lua, skynet-iads-contact.lua, skynet-iads-early-warning-radar.lua, skynet-iads-jammer.lua, skynet-iads-sam-search-radar.lua, skynet-iads-sam-site.lua, skynet-iads-sam-tracking-radar.lua, syknet-iads-sam-launcher.lua | sc tmp-code.lua 
$code = Get-Content tmp-code.lua
Add-Content tmp-time.lua $code
Rename-Item -Path tmp-time.lua -NewName skynet-iads-compiled.lua
Remove-Item tmp-code.lua

if (Test-Path ../demo-missions/skynet-iads-compiled.lua) {
	Remove-Item ../demo-missions/skynet-iads-compiled.lua
}

Move-Item -Path skynet-iads-compiled.lua ../demo-missions/skynet-iads-compiled.lua
