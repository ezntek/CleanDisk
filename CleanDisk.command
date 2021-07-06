clear
echo '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'
echo '$ CleanDisk By EasonTek2398 $'
echo '$ Version 1.0.1 $$$$$$$$$$$$$'
echo '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'
echo
echo
echo 'Welcome to CleanDisk!'
echo '1: Clean Temp Folder'
echo '2: Clean Caches'
echo '3: Clean Purgeable Space'
echo '4: Clean Time Machine Snapshots (Other or System section of About my mac storage)'
echo '5: Clean as much as possible'
echo
echo 'Exit by pressing Control+C'
echo
echo 'What to do? (Enter Number, Reference table above)'
read task
if [ $task = '1' ]
then
	echo STARTING
    echo "You may need to enter your Admin account Password (It won't be shown)"
	sleep 2
    mkdir ~/tmp
	sudo rm -rfv /private/tmp
    rm -rfv ~/tmp/*
    echo DONE
	sleep 2
	exit 0
elif [ $task = '2' ]
then
	echo 'Enter your Admin Account password (Password will not be shown, May need to be done multiple times)'
	sudo rm -rfv ~/Library/Cache/*
	sudo rm -rfv /Library/Cache/*
	sudo rm -rfv /System/Cache/*
	echo DONE
	sleep 2
	exit 0
elif [ $task = '3' ]
then
    echo PLEASE CLOSE ALL APPS, THIS WILL FILL UP THE ENTIRE DISK TO FORCE THE PURGEABLE
    echo STORAGE TO BE ACTIVATED, AND THE DUMMY FILES WILL BE DELETED AFTER THIS PROCESS.
    echo 'Please do NOT close this window until it automatically closes.'
    echo 'How much free space (INCLUDING PURGEABLE) is available? (In GB, eg: 100, Means 100GB Free, round down if there is a decimal)'
    read space
    mkdir ~/tmp
    mkdir ~/tmp/CleanDiskTempFiles
    mkdir ~/tmp/CleanDiskTempFiles/a
    dd if=/dev/zero of=~/tmp/CleanDiskTempFiles/a/dummyFileCleanDiskrun1 count=500 bs=1m
    dd if=/dev/zero of=~/tmp/CleanDiskTempFiles/a/dummyFileCleanDiskrun2 count=500 bs=1m
    cd ~/tmp/CleanDiskTempFiles/

    for ((n=0;n<=$space;n++)); do
            echo "Stage $n of $space"
            cp -r a $n
    done
    rm -rfv *
    
elif [ $task = '4' ]
then
    echo 'You may need to enter your admin account password (Will not be shown)'
    snap=$(sudo tmutil listlocalsnapshots / | grep com | sed 's/com.apple.TimeMachine.//' | sed 's/.local//' | wc -l | sed 's/ //g')
    for ((m=0;m<=$snap;m++));do
        tmutil deletelocalsnapshots $(sudo tmutil listlocalsnapshots / | grep com | sed 's/com.apple.TimeMachine.//' | sed 's/.local//' | sed -n '1p' )
    done
    echo DONE
    sleep 2
    exit 0
elif [ $task = '5' ]
then
    echo STARTING
    echo "You may need to enter your Admin account Password (It won't be shown)"
    sleep 2
    mkdir ~/tmp
    sudo rm -rfv /private/tmp
    rm -rfv ~/tmp/*
    echo 'Enter your Admin Account password (Password will not be shown, May need to be done multiple times)'
    sudo rm -rfv ~/Library/Cache/*
    sudo rm -rfv /Library/Cache/*
    sudo rm -rfv /System/Cache/*
    echo PLEASE CLOSE ALL APPS, THIS WILL FILL UP THE ENTIRE DISK TO FORCE THE PURGEABLE
    echo STORAGE TO BE ACTIVATED, AND THE DUMMY FILES WILL BE DELETED AFTER THIS PROCESS.
    echo 'Please do NOT close this window until it automatically closes.'
    echo 'How much free space (INCLUDING PURGEABLE) is available? (In GB, eg: 100, Means 100GB Free, round down if there is a decimal)'
    read space
    mkdir ~/tmp
    mkdir ~/tmp/CleanDiskTempFiles
    mkdir ~/tmp/CleanDiskTempFiles/a
    dd if=/dev/zero of=~/tmp/CleanDiskTempFiles/a/dummyFileCleanDiskrun1 count=500 bs=1m
    dd if=/dev/zero of=~/tmp/CleanDiskTempFiles/a/dummyFileCleanDiskrun2 count=500 bs=1m
    cd ~/tmp/CleanDiskTempFiles/
    for ((n=0;n<=$space;n++)); do
            echo "Stage $n of $space"
            cp -r a $n
    done
    rm -rfv *
    echo 'You may need to enter your admin account password (Will not be shown)'
    snap=$(sudo tmutil listlocalsnapshots / | grep com | sed 's/com.apple.TimeMachine.//' | sed 's/.local//' | wc -l | sed 's/ //g')
    for ((m=0;m<=$snap;m++));do
        tmutil deletelocalsnapshots $(sudo tmutil listlocalsnapshots / | grep com | sed 's/com.apple.TimeMachine.//' | sed 's/.local//' | sed -n '1p' )
    done
    echo DONE
    sleep 2
    exit 0
else
    exit 0
fi
