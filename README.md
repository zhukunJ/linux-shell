### 下载logstash包



```
[root@juke-huike-test1-node1 ~]# wget https://artifacts.elastic.co/downloads/logstash/logstash-6.7.0.tar.gz 
```



### 进入目录





```
[root@juke-huike-test1-node1 ~]# cd kuick/node1
```



### 



### 准备配置文件模版

```
input {
  elasticsearch {
    hosts => [ "es-cn-mp90wt1bn0019rd7g.elasticsearch.aliyuncs.com:9200" ]
    user => "elastic"
    password => "Uv4GDM4FnjF2oClGI8im"
    index =>
    query => '{ "query": { "query_string": { "query": "*" } } }'
    size => 10000
    scroll => "50m"
    docinfo => true
  }
}

filter {

}

output {
  elasticsearch {
    hosts => [ "es-cn-4591fkfqh001rjagm.elasticsearch.aliyuncs.com:9200" ]
    user => "elastic"
    password => "Uv4GDM4FnjF2oClGI8im"
    document_type => "%{[@metadata][_type]}"
    index =>
    document_id => "%{[@metadata][_id]}"
  }

  stdout {
  codec => "dots"
  }
}
```





### 需要同步索引存放文件



```
app_event_push_log app_event_push_log
im_chat_info im_chat_info
customer customer
person_member person_member
summary_hour_behavior_log summary_hour_behavior_log
add_friends add_friends
message_send_log message_send_log
chat_room chat_room
cc-deal_customer cc-deal_customer
cc-deal-form-test2 cc-deal-form-test2 
qr_code_fans qr_code_fans
im_like_info im_like_info
chat_room_member chat_room_member  
index_test index_test   
summary_hour_rule_action_log summary_hour_rule_action_log
index_customer_with_ex index_customer_with_ex 
promotion_plan_fans promotion_plan_fans
guid_member guid_member
im_comment_info im_comment_info
```





### 执行同步脚本

```
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
```
