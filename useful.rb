curl -XGET 'http://192.168.232.8:9200/classifiers_production_db_core_oshs_mvd_officials/_search?pretty' -d '
{"query":{"bool":{"must":[{"constantScore":{"filter":{"exists":{"field":"xxxxx"}}}}]}}}
'

curl -XGET 'http://192.168.232.8:9200/classifiers_production_db_core_kladr_streets/_search?pretty' -d '
{"query":{"bool":{"must":[{"constantScore":{"filter":{"exists":{"field":"xxxxx"}}}}]}}}
'

curl -XGET 'http://192.168.232.8:9200/classifiers_production_db_core_kladr_streets/_search?pretty' -d '
{"query":{"bool":{"must":[{"constantScore":{"filter":{"missing":{"field":"okato"}}}}]}}}
'

curl -XGET 'http://192.168.232.8:9200/classifiers_production_db_core_kladr_streets/_search?pretty' -d '
{
    "query" : {
      "bool": {
        "must": {
        "ids": {
          "values": [null]
        }
      }
    }
    }
}'


curl -XGET 'http://192.168.232.8:9200/classifiers_production_db_core_kladr_streets/_search?pretty' -d '
{
    "query" : {
      "bool": {
        "must": [
          {"ids": {
            "values": ["xxx","null"]
            }
          }
        ]
        }
      }
    }
}'


 Core::Cards::CitizenRequests::Card.where({$or => {_id => nil}})


 {
  "archived"=>false, 
  "provider_id"=>"543689d468ee000a74000001", 
  "is_reserved"=>{"$ne"=>true}, 
  "pages_count"=>123, 
  "sender_country"=>"548efab12981000003000001", 
  "sender_phone"=>"89176464", 
  "receiver_name"=>/Майданов/i, 
  "receipt_date"=>{"$gte"=>"2015-02-20 00:00:00 UTC", "$lte"=>"2015-02-27 00:00:00 UTC"},
  "answer_notifications.addressed_to_id"=>{"$all"=>["51bae98ef27369f77500017b", "51bace4af273695ed1000128"]}, 
  "themes"=>{"$in"=>["543685ff3058000673000001", "547d8d77fcbb0002a3000001", "547703983c53000184000001"]},
  "themes"=>{"$nin"=>["543685ff3058000673000001", "547d8d77fcbb0002a3000001", "547703983c53000184000001"]}
}


Core::Cards::CitizenRequests::Card.where(_id: {"$in"=>[1,2,3]}).with_elastic_search.query[:body]
Core::Cards::CitizenRequests::Card.where(_id: "34").with_elastic_search.query[:body]

Core::Cards::CitizenRequests::Card.where(  "archived"=>false, 
  "provider_id"=>"543689d468ee000a74000001", 
  "is_reserved"=>{"$ne"=>true}, 
  "pages_count"=>123, 
  "sender_country"=>"548efab12981000003000001", 
  "sender_phone"=>"89176464", 
  "receiver_name"=>/Майданов/i, 
  "receipt_date"=>{"$gte"=>"2015-02-20 00:00:00 UTC", "$lte"=>"2015-02-27 00:00:00 UTC"},
  "answer_notifications.addressed_to_id"=>{"$all"=>["51bae98ef27369f77500017b", "51bace4af273695ed1000128"]}, 
  "themes"=>{"$in"=>["543685ff3058000673000001", "547d8d77fcbb0002a3000001", "547703983c53000184000001"]},
  "themes"=>{"$nin"=>["543685ff3058000673000001", "547d8d77fcbb0002a3000001", "547703983c53000184000001"]},
  "_id" => {"$nin" => ["543685ff3058000673000001", "547d8d77fcbb0002a3000001", "547703983c53000184000001"]},
  "xxx" => {"$ne" => nil}
  ).with_elastic_search.query[:body]

54f486efb2fe000249000001
543777cd9b07000052000001
543cfd46527a0001e1000001

"reg_number"=>{"$ne"=>nil}

{"query"=>{
  "bool"=>{
    "must"=>[
      {"match_phrase"=>{"provider_id"=>"543689d468ee000a74000001"}},
      {"match_phrase"=>{"reg_number"=>"$ne"}},
      {"match_phrase"=>{"last_name_search"=>"мама"}}],
 "must_not"=>[{"match_phrase"=>{"uid"=>"01ff074526a1b8071917e3f4e826329d19b87ffdd2412487a436004be9c8572905"}}]}}}



 curl -XGET 'http://192.168.232.8:9200/classifiers_production_db_core_kladr_streets/_search?pretty' -d '
{"query":{"bool":{"must_not":[ {"match_phrase" :{"constantScore":{"filter":{"missing":{"field":"okato"}}}}}]}}}
'

 curl -XGET 'http://192.168.232.8:9200/classifiers_production_db_core_kladr_streets/_search?pretty' -d '
{"query":{"bool":{"must_not":[{"constantScore":{"filter":{"missing":{"field":"reg_number"}}}}]}}}
'

curl -XGET 'http://192.168.232.8:9200/oshsmvd_official/_search?pretty' -d '
{
  "query": {
      "bool": {
        "must":[
          {"match": {"short_name": "ул"}},
          {"bool": {
            "should":[
              {"match":{"name": "Школьная"}}
            ]
          }
          }
        ]
    }
  }
}
'

curl -XGET 'http://192.168.232.8:9200/classifiers_production_db_core_oshs_mvd_officials/_search?pretty' -d '
{:body=>
  {"query"=>
    {"bool"=>
      {"must"=>
        [
          {"constantScore"=>{"filter"=>{"missing"=>{"field"=>"_id"}}}}]}}, "sort"=>[{"last_name"=>"asc"}, {"first_name"=>"asc"}, {"middle_name"=>"asc"}, "_score"]}, :index=>"classifiers_production_db_core_oshs_mvd_officials", :size=>50, :from=>0}
'