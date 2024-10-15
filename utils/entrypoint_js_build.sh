#!/bin/bash

usermod -u ${NODE_JS_UID} node
sudo chown node:node /home/node/.npm-global 
sudo chmod -R 755 /home/node/.npm-global

echo "Unlinking all globally linked npm packages..."
for package in $(npm ls -g --depth=0 --parseable | tail -n +2 | awk -F/ '{print $NF}'); do
  if [[ $package == 'corepack' ]] || [[ $package == 'npm' ]]; then 
    continue
  fi
  echo "Unlinking package: $package"
  npm unlink -g "$package"
done


echo "Linking Libraries"
for dir in /home/node/lib/*/; do
  if [ -d "$dir" ]; then
    cd "$dir"
    if [ -f "package.json" ]; then
      package_name=$(node -p "require('./package.json').name")
      if [ "$package_name" ]; then
        echo "Linking package: $package_name"
        npm link
        cd  /home/node/app
        npm link $package_name
      else
        echo "Skipping $(basename $dir), no valid package name in package.json"
      fi
    else
      echo "Skipping $(basename $dir), no package.json found"
    fi
  fi
done

echo "Going to App root"
cd  /home/node/app
ls -l

npm install
echo "Launch application"
exec "$@"
