Testing searchkick and draftsman on Heroku

https://peaceful-earth-5976.herokuapp.com/

Heroku and ElasticSearch

heroku addons:add searchbox:starter
heroku config:add ELASTICSEARCH_URL=`heroku config:get SEARCHBOX_URL`
heroku run rake searchkick:reindex CLASS=Video