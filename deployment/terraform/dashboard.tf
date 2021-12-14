# Configure the Datadog provider
provider "datadog" {
api_key = "******"
app_key = "******"
}

resource "datadog_dashboard_json" "dashboard_json" {
dashboard = <<EOF
{
"title":"lab-network-db-lambda-apigtw",
"description":"",
"widgets":[
    {
        "id":2531428834646096,
        "definition":{
            "title":"",
            "title_size":"16",
            "title_align":"left",
            "time":{
            
            },
            "type":"timeseries",
            "requests":[
            {
                "formulas":[
                    {
                        "formula":"query1"
                    }
                ],
                "queries":[
                    {
                        "data_source":"metrics",
                        "name":"query1",
                        "query":"avg:aws.rds.total_storage_space{*}"
                    }
                ],
                "response_format":"timeseries",
                "style":{
                    "palette":"dog_classic",
                    "line_type":"solid",
                    "line_width":"normal"
                },
                "display_type":"line"
            }
            ],
            "yaxis":{
            "scale":"linear",
            "include_zero":true,
            "label":"",
            "min":"auto",
            "max":"auto"
            },
            "markers":[
            
            ]
        },
        "layout":{
            "x":0,
            "y":0,
            "width":4,
            "height":2
        }
    },
    {
        "id":3766080811965414,
        "definition":{
            "title":"",
            "title_size":"16",
            "title_align":"left",
            "time":{
            
            },
            "type":"timeseries",
            "requests":[
            {
                "formulas":[
                    {
                        "formula":"query1"
                    }
                ],
                "queries":[
                    {
                        "data_source":"metrics",
                        "name":"query1",
                        "query":"avg:aws.lambda.invocations{*}.as_count()"
                    }
                ],
                "response_format":"timeseries",
                "style":{
                    "palette":"dog_classic",
                    "line_type":"solid",
                    "line_width":"normal"
                },
                "display_type":"bars"
            }
            ],
            "yaxis":{
            "scale":"linear",
            "include_zero":true,
            "label":"",
            "min":"auto",
            "max":"auto"
            },
            "markers":[
            
            ]
        },
        "layout":{
            "x":4,
            "y":0,
            "width":4,
            "height":2
        }
    }
],
"template_variables":[
    
],
"layout_type":"ordered",
"is_read_only":false,
"notify_list":[
    
],
"reflow_type":"fixed",
"id":"8n9-7qq-na6"
}
EOF
}
