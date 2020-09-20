# Preview image      
      On a image viewer:
            eog   <picture.jpg>
            feh   <picture.jpg>

      Inside terminal:
            git clone https://github.com/stefanhaustein/TerminalImageViewer.git
            cd TerminalImageViewer/src/main/cpp
            make
            sudo make install
      
            tiv   <picture.jpg>

# Transfer file over network using SCP
      Fetch file from remote machine:
            scp  remote@ip:/path/of/file  /destination/of/file
      
      Send file to remote machine:
            scp  /path/of/file  remote@ip:/destination/of/file

# Stegnography using steghide
      Embed message:     steghide embed -cf image.jpg -ef sectete_message.txt
      Extract message:   steghide extract -sf image.jpg 
      
