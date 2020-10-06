
#!/bin/sh

# Change the prompt
PS1="$: "

# Install git-crypt
sudo apt-get update
sudo apt-get install -y git-crypt

# install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
export NVM_DIR="/home/coder/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 

# Install node and npm
nvm install 10

# Install azcure cli
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install devops extension
az extension add --name azure-devops

# Install jq
sudo apt-get install -y jq


#export GNUPGHOME="$(mktemp -d)"
cat > /tmp/foo <<EOF
     %echo Generating a basic OpenPGP key
     Key-Type: DSA
     Key-Length: 1024
     Subkey-Type: ELG-E
     Subkey-Length: 1024
     Name-Real: Andres FUentes
     Name-Comment: with stupid passphrase
     Name-Email: somebody@chimpwizards.com
     Expire-Date: 0
     Passphrase: changeit
     # Do a commit here, so that we can later print "done" :-)
     %commit
     %echo done
EOF
gpg --batch --generate-key /tmp/foo
gpg --list-keys somebody@chimpwizards.com
GNUID=$(gpg --list-keys somebody@chimpwizards.com|grep "      "|head -n 1)
gpg --armor --export $GNUID > /tmp/GNUPUBLIC.KEY
cat /tmp/GNUPUBLIC.KEY

#gpg --keyserver https://pgp.mit.edu/ --send-keys $GNUID
echo "******************************************"
echo "*** Ask the lockbox admin to add your key"
echo "******************************************"
echo "ADMIN SHOULD RUN:"
echo ""
#echo "gpg --keyserver hjttps://pgp.mit.edu --recv-key $GNUID"
#echo "git-crypt add-gpg-user --trusted developer@somewhere.com"
GNUKEY=$(cat /tmp/GNUPUBLIC.KEY)
echo "echo \""$GNUKEY\"" > ./lockbox/secured-files/GNU.ID"
echo "gpg --import ./lockbox/secured-files/GNU.ID"
echo "cd lockbox"
echo "git-crypt add-gpg-user --trusted developer@somewhere.com"
echo "git commit -am \"New user developer@somewhere.com\"; git push"
read -n 1 -p "Press <ENTER> to continue? "

cd lockbox
git pull
git-crypt unlock
cd ..

# Set git global info
git config --global user.name "ndruwizz"
git config --global user.email "ndru@chimpwizard.com"
git config --global credential.helper store

# Set Environment defaults
. $(dirname "${BASH_SOURCE[0]}")/set-env.sh

# install wand
npm i -g @chimpwizards/wand

# Pull all app
w w update

# Pull dependencies and Build
w x 'npm i'
w x 'npm run build'

