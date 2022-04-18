BRANCH=`git branch --show-current`

if [[ $BRANCH == "master" ]]
then
  echo "ENVIRONMENT=prod" >> $GITHUB_ENV 
elif [[ $BRANCH == "dev" ]]
then
  echo "ENVIRONMENT=dev" >> $GITHUB_ENV
else
    echo "No Environment Selected"
fi

