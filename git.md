## GIT Config:
```sh
git config --global user.name "Anurag Kumar Singh"
git config --global user.email anurag3301.0x0@gmail.com

git config --global core.editor "vim"             # For VIM
git config --global core.editor "code --wait"     # For VS Code

git config --global core.autocrlf input           # For Mac/Linux
git config --global core.autocrlf type            # For Windows

git config --global -e  
```

## SSH Key Setup:
```sh
#Generate a new SSH public/private key:
ssh-keygen -t rsa -b 4096 -C "anurag3301.0x0@gmail.com"

#Activate SSH agent:
eval $(ssh-agent -s)

#Add the new key:
ssh-add ~/.ssh/id_rsa

#Copy the public key from output of following command:
cat ~/.ssh/id_rsa.pub

#Paste The Key in GitHub > Setting > SSH and GPG keys > New SSH key
```

## GPG Key Setup:
```sh
#Generate a GPG key and enter the details:
gpg --full-gen-key

#Get your GPG keys and get the part after / in the line starts with "sec". Eg 0E6198DFB2D67A26:
gpg --list-secret-keys --keyid-format long

#Get the public key using the GPG key ID and paste it to GitHub > Setting > SSH and GPG keys > New GPG key:
gpg --armor --export {KEY ID}
gpg --armor --export E46B6F176910EA41

#Now config your git to sign commits using the KEY-ID:
git config --global user.signingkey E46B6F176910EA41
git config --global user.signingkey {KEY-ID}

#Now congit your git to sign every commit made on the system:
git config --global commit.gpgsign true
```

## Backup GPG and SSH key:
#### For GPG key
```sh
# List the gpg keys info
gpg --list-secret-keys --keyid-format LONG

# Get the id get the part after / in the line starts with "sec". Eg E46B6F176910EA41:
gpg --export-secret-keys $ID > my-private-key.asc
```
#### For SSH key
```sh
# Just zip the ~/.ssh dir
cd ~ && zip -r ssh-key.zip .ssh
```

## Restore GPG and SSH Key
#### For GPG key
```sh
gpg --import my-private-key.asc
```
### For SSH key
```sh
cp ssh-key.zip ~ && cd ~ && unzip ssh-key.zip
chown anurag:anurag ~/.ssh/id_rsa*
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
```
