# linux-shell


自建logstash同步
依赖Java环境
自行安装Java环境

下载logstash包
[root@juke-huike-test1-node1 ~]# wget https://artifacts.elastic.co/downloads/logstash/logstash-6.7.0.tar.gz
[root@juke-huike-test1-node1 ~]# tar xzf logstash-6.7.0.tar.gz && cd logstash-6.7.0/config/
准备配置文件模版
[root@juke-huike-test1-node1 config]# cat kuick.conf
input {
  elasticsearch {
    hosts => [ "es-cn-mp90wvbo9001fojq4.public.elasticsearch.aliyuncs.com:9200" ]
    user => "elastic"
    password => "0RmbgFuzYbv2oSDGn0cV"
    index =>
    query => '{ "query": { "query_string": { "query": "*" } } }'
    size => 5000
    scroll => "5m"
    docinfo => true
  }
}

filter {}


output {
  elasticsearch {
    hosts => [ "es-cn-mp91e59f20002va73.elasticsearch.aliyuncs.com:9200" ]
    user => "elastic"
    password => "fgElwzGY2M4YAyMgwHav"
    document_type => "%{[@metadata][_type]}"
    index =>
    document_id => "%{[@metadata][_id]}"
  }


  stdout {
  codec => "dots"
 
需要同步索引存放文件
[root@juke-huike-test1-node1 config]# cat indexs
person_member person_member
im_like_info im_like_info
im_comment_info im_comment_info
im_chat_info im_chat_info
guid_member guid_member
chat_room_member chat_room_member
chat_room chat_room
add_friends add_friends
cc-deal-form cc-deal-form-test3
app_event_push_log app_event_push_log
执行同步脚本
[root@juke-huike-test1-node1 config]# cat run.sh
#!/bin/bash

template_file="kuick.conf"

process(){
    ../bin/logstash -f kuick/${2} --path.data=data/${1}
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
echo "done .
总结
尽量把机器外网带宽调整到最大
同步一下启动多个logstash进程放后台运行，机器负载会稍高
目前所有索引同步完成时间在一小时以内
