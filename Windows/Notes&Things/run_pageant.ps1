try{
    Start-Process -FilePath "C:\Program Files\PuTTY\pageant.exe" -ArgumentList "C:\Users\tmartin\Documents\tmartin.ppk"
}
catch { }



"C:\Program Files\PuTTY\pageant.exe" "C:\Users\tmartin\Documents\tmartin.ppk" -c "C:\Program Files\PuTTY\putty.exe"
