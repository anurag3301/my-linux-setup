# GIT Config:
      git config --global user.name "Anurag Kumar Singh"
      git config --global user.email anuragkumar07102003@gmail.com
      
      git config --global core.editor "vim"             //For VIM
      git config --global core.editor "code --wait"     //For VS Code
      
      git config --global core.autocrlf input           //For Mac/Linux
      git config --global core.autocrlf type            //For Windows
      
      git config --global -e  
      
      
# SSH Setup:
      Generate a new SSH public/private key:
            ssh-keygen -t rsa -b 4096 -C "email@gmail.com"
      
      Activate SSH agent:
            eval $(ssh-agent -s)
      
      Add the new key:
            ssh-add ~/.ssh/id_rsa
  
     Copy the public key from output of following command:
            ssh-add ~/.ssh/id_rsa

     Paste The Key in GitHub > Setting > SSH and GPG keys > New SSH key
