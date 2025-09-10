# Ghostty Broadcast

A utility that broadcasts commands to all open tabs in the Ghostty terminal emulator using AppleScript.

## Features

- Broadcasts any command to all open Ghostty tabs
- Simple command-line interface
- Built-in error handling
- Desktop notifications on completion

## Installation

1. Clone or download this repository
2. Make sure the shell script is executable:
   ```bash
   chmod +x ghostty-broadcast
   ```

## Usage

### Command Line
```bash
./ghostty-broadcast "command to broadcast"
```

### Examples

Send a simple echo command to all tabs:
```bash
./ghostty-broadcast "echo 'Hello from all tabs!'"
```

List directory contents in all tabs:
```bash
./ghostty-broadcast "ls -la"
```

Change directory in all tabs:
```bash
./ghostty-broadcast "cd /path/to/directory"
```

Run a git status check in all tabs:
```bash
./ghostty-broadcast "git status"
```

### Direct AppleScript Usage
You can also run the AppleScript directly:
```bash
osascript ghostty-broadcast.applescript "echo 'Direct AppleScript call'"
```

## How It Works

The utility uses AppleScript through System Events to:
1. Find all open tabs in the Ghostty window
2. Click each tab to select it
3. Send keystrokes to type the command
4. Press Enter to execute the command
5. Move to the next tab with a small delay

## Requirements

- macOS (tested with macOS 14+)
- Ghostty terminal emulator
- Accessibility permissions for the terminal/script runner

## Troubleshooting

### Permission Issues
If you encounter permission errors, you may need to grant accessibility permissions:
1. Go to System Preferences → Security & Privacy → Privacy
2. Select "Accessibility" from the left panel
3. Add your terminal application (Terminal.app, iTerm2, etc.) to the list

### No Ghostty Windows Found
Make sure Ghostty is running with at least one window open before running the utility.

### Commands Not Executing
- Ensure there's no text selected in the tabs before running
- Try increasing delays in the AppleScript if commands are being sent too quickly

## Files

- `ghostty-broadcast.applescript` - Main AppleScript logic
- `ghostty-broadcast` - Shell wrapper for easy CLI usage
- `README.md` - This documentation

## License

MIT License - feel free to modify and distribute as needed.