@echo off
setlocal enabledelayedexpansion

:: Set the working directory manually here (ensure there are quotes around paths with spaces)
set "working_dir=E:\PRJ\SWR\My game Project\Game assets\[CHARACTERS]\{CAST}\done\[PARALELS]\{CARD}\.Mario Set\output\2024-09-19___15-12-43\links"

:: Path to the text file with the URLs (in the same working directory)
set "url_file=%working_dir%\urls.txt"

:: Directory to store the .url files (same as working directory)
set "output_dir=%working_dir%"

:: Debugging: Print the working directory and URL file path
echo Working Directory: %working_dir%
echo URL File: %url_file%
echo Output Directory: %output_dir%

:: Pause to allow the user to see the printed paths
pause

:: Loop through the URL file, skipping empty lines and lines starting with semicolons (comments)
for /f "usebackq tokens=*" %%A in ("%url_file%") do (
    set "url=%%A"
    
    :: Skip empty lines or lines with just spaces
    if not "!url!"=="" (
        
        :: Extract the filename as the part after the last "/"
        for %%B in ("!url!") do (
            set "filename=%%~nxB"
        )

        :: Debugging: Print the filename and URL being processed
        echo Creating shortcut for: !url!
        echo Filename: !filename!

        :: Create the .url file
        echo [InternetShortcut] > "%output_dir%\!filename!.url"
        echo URL=!url! >> "%output_dir%\!filename!.url"
    )
)

echo Done! Created shortcuts in the "%output_dir%" folder.
pause
