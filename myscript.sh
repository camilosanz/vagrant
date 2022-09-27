#!/bin/sh

RUNNER_URL=$1
GITHUB_URL=$2
GITHUB_TOKEN=$3
RUNNER_NAME=$4
RUNNER_DIR=$5
RUNNER_VERSION=$6
GITHUB_HASH=$7
RUNNER_SVC=$8
REPO_NAME=$9
GIT_REMOTE=${10}-${9}


if [ -d "$RUNNER_DIR" ]; then

    mkdir -p $RUNNER_DIR && cd $RUNNER_DIR

    # if [ ! -d "$REPO_NAME" ]; then
    #     mkdir -p $REPO_NAME && cd $REPO_NAME
    #     if [ ! -d "$REPO_NAME/.git/"]; then
    #         git init
    #     fi
    # fi

    # cd $REPO_NAME

    # if [ grep --max-count=1 ".git/origin" config == '[remote "origin"]' ]; then
    #     git remote add origin ${10}-${9}
    # fi
    # if [ ! -d ".github/workflows" ];then
    #     mkdir -p .github/workflows
    # fi

    # scp /ubuntu_runner/mypipeline.yml vagrant@127.0.0.1:/home/vagrant/actions-runner/vagrant/.github/workflows

    # git add .

    # git commit -m "add workflows"

    # git push -u origin main

    # cd ..

    if [ ! -d "$RUNNER_DIR-$RUNNER_VERSION" ]; then
    
        curl -o $RUNNER_DIR-$RUNNER_VERSION -L $RUNNER_URL

        echo "$GITHUB_HASH  $RUNNER_DIR-$RUNNER_VERSION" | shasum -a 256 -c

        tar xzf ./$RUNNER_DIR-$RUNNER_VERSION

        ./config.sh --url $GITHUB_URL --token $GITHUB_TOKEN --unattended --name $RUNNER_NAME

    fi

fi

cd $RUNNER_DIR

if [ ! -f "/etc/systemd/system/$RUNNER_SVC" ]; then

    sudo ./svc.sh install

fi