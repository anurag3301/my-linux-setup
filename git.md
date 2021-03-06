# GIT Config:
      git config --global user.name "Anurag Kumar Singh"
      git config --global user.email anuragkumar07102003@gmail.com
      
      git config --global core.editor "vim"             //For VIM
      git config --global core.editor "code --wait"     //For VS Code
      
      git config --global core.autocrlf input           //For Mac/Linux
      git config --global core.autocrlf type            //For Windows
      
      git config --global -e  
      
      
# SSH Key Setup:
      Generate a new SSH public/private key:
            ssh-keygen -t rsa -b 4096 -C "email@gmail.com"
      
      Activate SSH agent:
            eval $(ssh-agent -s)
      
      Add the new key:
            ssh-add ~/.ssh/id_rsa
  
     Copy the public key from output of following command:
            ssh-add ~/.ssh/id_rsa

     Paste The Key in GitHub > Setting > SSH and GPG keys > New SSH key

# GPG Key Setup:
      Generate a GPG key and enter the details:
            gpg --full-gen-key

      Get your GPG keys and get the past after / in the line starts with "sec". Eg 0E6198DFB2D67A26:
            gpg --list-secret-keys --keyid-format long
      
      Get the public key using the GPG key ID and paste it to GitHub > Setting > SSH and GPG keys > New GPG key:
            gpg --armor --export {KEY ID}
            gpg --armor --export 0E6198DFB2D67A26

      Now config your git to sign commits using the KEY-ID:
            git config --global user.signingkey 0E6198DFB2D67A26
            git config --global user.signingkey {KEY-ID}

      Now congit your git to sign every commit made on the system:
            git config --global commit.gpgsign true


      


        
