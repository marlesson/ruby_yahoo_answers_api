# RubyYahooAnswersAPI

GEM Integrate for Yahoo! Answers API

## Yahoo Answers

Yahoo! Answers is a place where people ask and answer questions on any topic. The Answers API lets you tap into the 
collective knowledge of millions of Yahoo! users. Search for expert advice on any topic, watch for new questions in
the Answers categories of your choice, and keep track of fresh content from your favorite Answers experts.

## Functions

### question_search(query, parameters = {})
Find questions that match your query.

### get_by_category(parameters = {})
List questions from one of our hundreds of categories, filtered by type. You'll need the category name or ID, 
which you can get from questionSearch.

* get_by_category_name(name, parameters = {})
* get_by_category_id(id, parameters = {})

### get_question(question_id)
Found an interesting question? getQuestion lists all the details for every answer to the question ID you specify, 
including the best answer, if it's been chosen. Get that question ID from questionSearch or getByCategory.

### get_by_user(user_id, parameters = {})
List questions from specific users on Yahoo! Answers. You'll need the user id, which you can get from any of the 
other services listed above.

## Usage
