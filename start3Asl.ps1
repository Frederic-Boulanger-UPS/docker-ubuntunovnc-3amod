# Has to be authorized using:
# Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
docker run --rm -d -p 6080:80 -v "$(PWD):/workspace:rw" -e USER=student -e RESOLUTION=1680x1050 --name ubuntu-novnc-3amod-run fredblgr/ubuntunovnc-3amod:2020
Start-Sleep -s 5
Start http://localhost:6080
