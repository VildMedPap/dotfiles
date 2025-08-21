#!/usr/bin/env python3
import json
import sys
import subprocess
import os
from datetime import datetime

def get_git_branch():
    """Get current git branch name."""
    try:
        result = subprocess.run(['git', 'branch', '--show-current'], 
                              capture_output=True, text=True, cwd=os.getcwd())
        if result.returncode == 0 and result.stdout.strip():
            return result.stdout.strip()
        return "no-git"
    except:
        return "no-git"

def get_project_name():
    """Get project name from current directory."""
    return os.path.basename(os.getcwd())

def main():
    try:
        # Read JSON input from stdin
        input_data = json.loads(sys.stdin.read())
        
        # Get current time
        current_time = datetime.now().strftime("%H:%M:%S")
        
        # Extract data from input
        model_name = input_data.get('model', {}).get('display_name', 'Unknown Model')
        output_style = input_data.get('output_style', {}).get('name', 'default')
        
        # Get dynamic data
        project_name = get_project_name()
        git_branch = get_git_branch()
        
        # Color codes for vibrant display
        colors = {
            'reset': '\033[0m',
            'cyan': '\033[96m',      # Time
            'magenta': '\033[95m',   # Model
            'yellow': '\033[93m',    # Project
            'green': '\033[92m',     # Git branch
            'blue': '\033[94m',      # Output style
            'white': '\033[97m',     # Separators
            'dim': '\033[2m'         # Dim for separators
        }
        
        # Build the colorful statusline with emojis
        statusline_parts = [
            f"{colors['cyan']}🕒 {current_time}{colors['reset']}",
            f"{colors['magenta']}🤖 {model_name}{colors['reset']}",
            f"{colors['yellow']}📁 {project_name}{colors['reset']}",
            f"{colors['green']}🌿 {git_branch}{colors['reset']}",
            f"{colors['blue']}🎨 {output_style}{colors['reset']}"
        ]
        
        # Join with dimmed pipe separators
        separator = f" {colors['dim']}{colors['white']}|{colors['reset']} "
        statusline = separator.join(statusline_parts)
        
        print(statusline)
        
    except Exception as e:
        # Fallback to simple display if something goes wrong
        print(f"🔧 Claude Code | ⚠️  Error: {str(e)}")

if __name__ == "__main__":
    main()