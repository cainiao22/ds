{
    "job": {
        "setting": {
            "speed": {
                 "byte": 1048576
            }
        },
        "content": [
            {
                "reader": {
                    "name": "${dataName}",
                    "parameter": {
                        "username": "${username}",
                        "password": "${password}",
                        "connection": [
                            {
                                "querySql": [
                                    "SELECT
                                    <#list list as ss>
                                    REPLACE(REPLACE(${ss},char(10),''),char(13),'')
                                    <#if ss_has_next>,</#if>
                                    </#list>
                                    FROM ${tableName}"
                                ],
                                "jdbcUrl": [
                                    "${jdbcUrl}",
                                ]
                            }
                        ]
                    }
                },
                "writer": {
                    "name": "hdfswriter",
                    "parameter": {
                        "defaultFS": "${defaultFS}",
                        "fileType": "text",
                        "path": "${path}",
                        "fileName": "${fileName}",
						"column": [
                            <#list list as a>
                                {
                                "name": "${a}",
                                "type": "STRING"
                                }<#if a_has_next>,</#if>
                            </#list>
                        ],
                        "fieldDelimiter": "${fieldDelimiter}",
                        "writeMode": "${writeMode}",
						"compress":"${compress}",
						"hadoopConfig":{
							"dfs.nameservices":"nameservice1",
							"dfs.ha.namenodes.nameservice1":"namenode209,namenode250",
							"dfs.namenode.rpc-address.aliDfs.namenode209": "10.37.5.112:8020",
							"dfs.namenode.rpc-address.aliDfs.namenode250": "10.37.5.113:8020",
							"dfs.client.failover.proxy.provider.nameservice1": "org.apache.hadoop.hdfs.server.namenode.ha.ConfiguredFailoverProxyProvider"
						}							
                    }
                }
            }
        ]
    }
}