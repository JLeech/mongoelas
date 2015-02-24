Model.all_in | Criteria#all_in
{ "aliases" : { "$all" : [ "Bond", "007" ] }}

Model.all_of | Criteria#all_of
{ "$and" : [{ "age" : { "$gt" : 60 }}, { "mental_state" : "crazy mofos" }] }

Model.also_in | Criteria#also_in
{ "aliases" : { "$in" : [ "Bond", "007" ] }}

Criteria#and
{ "last_name" : "Jordan", "first_name" : /^d/i }

Model.any_in | Criteria#any_in
{ "aliases" : { "$in" : [ "Bond", "007" ] }}

Model.any_of | Criteria#any_of
{ "last_name" :
  { "$or" :
    [ { "last_name" : "Penn" }, { "last_name" : "Teller" } ]
  }
}


Model.asc | Criteria#asc
{ "sort" :
    {[ [ "first_name", Mongo::ASCENDING ],
      [ "last_name", Mongo::ASCENDING ] ]} }

Model.desc | Criteria#desc
{ "sort" :
    {[ [ "first_name", Mongo::DESCENDING ],
      [ "last_name", Mongo::DESCENDING ] ]} }

Criteria#distinct(name)
{ "distinct" : "last_name" }

Model.excludes | Criteria#excludes
{{ "last_name" : { "$ne" : "Teller" } }, { "first_name" : { "$ne" : "Bob" } }}


Model.includes | Criteria#includes
people_ids = people.find({}, { "fields" : { "_id" : 1 }})
posts.find({ "person_id" : { "$in" : people_ids }})
games.find({ "person_id" : { "$in" : people_ids }})


Model.limit | Criteria#limit
{ "limit" : 20 }

Model.near | Criteria#near
{ "location" : { "$near" : [ 52.30, 13.25 ] }}

Model.not_in | Criteria#not_in
{{ "last_name" : { "$nin" : [ "Zorg", "Dallas" ] } }}

Model.only | Criteria#only
{ "fields" : { "first_name" : 1, "last_name" : 1 }}

Model.order_by | Criteria#order_by
{ "sort" :
    {[ [ "first_name", Mongo::ASCENDING ],
      [ "last_name", Mongo::DESCENDING ] ]} }

Model.skip | Criteria#skip
{ "skip" : 20 }