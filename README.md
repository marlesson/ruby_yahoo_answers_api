# RubyYahooAnswersAPI

GEM Integrate for Yahoo! Answers API

## Yahoo Answers

Yahoo! Answers is a place where people ask and answer questions on any topic. The Answers API lets you tap into the 
collective knowledge of millions of Yahoo! users. Search for expert advice on any topic, watch for new questions in
the Answers categories of your choice, and keep track of fresh content from your favorite Answers experts.

## Features

### question_search(query, parameters = {})
Find questions that match your query.

http://developer.yahoo.com/answers/V1/questionSearch.html

### get_by_category(parameters = {})
List questions from one of our hundreds of categories, filtered by type. You'll need the category name or ID, 
which you can get from questionSearch.

* get_by_category_name(name, parameters = {})
* get_by_category_id(id, parameters = {})

http://developer.yahoo.com/answers/V1/getByCategory.html

### get_question(question_id)
Found an interesting question? getQuestion lists all the details for every answer to the question ID you specify, 
including the best answer, if it's been chosen. Get that question ID from questionSearch or getByCategory.

http://developer.yahoo.com/answers/V1/getQuestion.html

### get_by_user(user_id, parameters = {})
List questions from specific users on Yahoo! Answers. You'll need the user id, which you can get from any of the 
other services listed above.

http://developer.yahoo.com/answers/V1/getByUser.html

## Installation


```ruby
gem install ruby_yahoo_answers_api
```

## Usage

```ruby

#ProjectID create in https://developer.apps.yahoo.com/dashboard/createKey.html
projet_id = 'XXXXXX'

client = RubyYahooAnswersApi::Client.new(projet_id)

result = client.question_search("api ruby", :region => "us", :results => 5)

result.Question[0].Subject
=> "what api's are available to retrieve UK businesses?"

result.Question[0].Link
=> "http://answers.yahoo.com/question/?qid=20100302101834AA5hHUq"

q = client.get_question(result.Question[0].id)

q.Question.UserId
=> "UVijdUs7aa"

q.Question.Answers.Answer
=> <XmlHate::Node:0x5760240 @Timestamps=["1267555054"], @UserNick="CheesenBranston", 
@UserNicks=["CheesenBranston"], @Best="5", @UserIds=["Lmf5kgu8aa"], @Dates=["2010-03-02 10:37:34"],
@Bests=["5"], @Date="2010-03-02 10:37:34", @UserId="Lmf5kgu8aa", @References=["Google"], 
@Timestamp="1267555054", @Contents=["A couple here\nhttp://www.scoot.co.uk/about-us/add-scoot/
api.html\nhttp://www.yelp.com/developers/documentation/search_api\n\nYell is the one that always 
springs to mind for me, but there is no info readily available on their site. You could try
contacting them."], @Reference="Google", @Content="A couple here\nhttp://www.scoot.co.uk/about-us/
add-scoot/api.html\nhttp://www.yelp.com/developers/documentation/search_api\n\nYell is the one 
that always springs to mind for me, but there is no info readily available on their site. You could try 
contacting them.">


q.Question.Answers.Answer.Content
=> "A couple here\nhttp://www.scoot.co.uk/about-us/add-scoot/api.html\nhttp://www.yelp.com/developers/
documentation/search_api\n\nYell is the one that always springs to mind for me, but there is no info 
readily available on their site. You could try contacting them."


```

## Demo Rails Application

Demo application for use the gem.

https://github.com/marlesson/demo_rails_yahoo_answers_api
