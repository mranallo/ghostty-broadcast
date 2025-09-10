on run argv
	if length of argv is 0 then
		display dialog "Usage: osascript ghostty-broadcast.applescript \"command to broadcast\""
		return
	end if
	
	set commandToSend to item 1 of argv
	
	try
		tell application "ghostty" to activate
		delay 0.5
		
		tell application "System Events"
			tell process "ghostty"
				if not (exists window 1) then
					display dialog "No Ghostty windows found. Please open Ghostty first."
					return
				end if
				
				set tabCount to count of (every radio button of tab group "tab bar" of window 1)
				
				if tabCount is 0 then
					display dialog "No tabs found in Ghostty window."
					return
				end if
				
				repeat with currentTab from 1 to tabCount
					click radio button currentTab of tab group "tab bar" of window 1
					delay 0.2
					
					keystroke commandToSend
					delay 0.1
					
					key code 36
					delay 0.3
				end repeat
				
			end tell
		end tell
		
		display notification "Command broadcasted to " & tabCount & " tabs" with title "Ghostty Broadcast"
		
	on error errMsg
		display dialog "Error: " & errMsg
	end try
end run