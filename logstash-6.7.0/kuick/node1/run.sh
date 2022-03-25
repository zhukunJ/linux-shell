#!/bin/bash

template_file="kuick.conf"

process(){
    ../../bin/logstash -f kuick/${2} --path.data=data/${1} -w 8 -b 6000
}


cat indexs | while read sindex dindex
do
{
	config_file=${sindex}.conf
	cp ${template_file} kuick/${config_file}
	sed -i "6s/index.*/index =>\"${sindex}\"/g" kuick/${config_file}
	sed -i "24s/index.*/index =>\"${dindex}\"/g" kuick/${config_file}
	process ${sindex} ${config_file} &
}
done
wait

echo "done ..."