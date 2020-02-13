cd $JENKINS_HOME/workspace/$JOB_NAME
echo "$1"
echo "$2"
names="$*"
echo "$names"
mkdir static_code1
IFS=' ' read -r -a array <<< "$names"
for i in "${array[@]}"
do
  	IFS='/' read -r -a array1 <<< "$i"
	path=""
	p="/"
	temp=${#array1[@]}
	temp=$temp-1
	for index in "${!array1[@]}"
	do
   		if [ $index == $temp ]
    	then 
   			cp  $path${array1[index]} ./static_code1/$path${array1[index]}
            
   		else
        	mkdir $JENKINS_HOME/workspace/$JOB_NAME/static_code1/$path${array1[index]}
        	path=$path${array1[index]}$p
   		fi
   
	done 
done
cd /Users/srikar.nallapu/.jenkins/workspace/$JOB_NAME/static_code1
cp -R /Users/srikar.nallapu/.jenkins/workspace/$JOB_NAME/static_code1 /Users/srikar.nallapu/.jenkins/workspace/output123
export PATH=/usr/local/bin
eslint  -f json -c $JENKINS_HOME/workspace/static_config.json /Users/srikar.nallapu/.jenkins/workspace/output123  -o $JENKINS_HOME/workspace/$JOB_NAME/result.json || echo "lint failed but continiung the process"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
npm install request
