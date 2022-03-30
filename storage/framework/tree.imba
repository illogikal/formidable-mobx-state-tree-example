
import { types, addMiddleware } from "mobx-state-tree"
import { faker } from '@faker-js/faker';
let id = 0

const Author = types.model({
	id: types.identifier,
	firstName: types.string,
	lastName: types.string
})

const Tweet = types.model({
	id: types.identifier,
	author: types.reference(Author), 
	body: types.string,
	timestamp: types.number
}).views(do |tweet| 
	{
		get author_name 
			"{tweet.author.firstName} {tweet.author.lastName}" 
	}
)

let newtweets
let makeNewTweets = do 
	newtweets = setInterval((do 
		const [firstName, lastName] = faker.name.findName().split(' ')
		const author = {
			id: faker.random.uuid(),
			firstName,
			lastName
		}
		const tweet = {
			id: "{id++}",
			author: author.id, 
			body: faker.lorem.sentence(),
			timestamp: Date.now()
		}
		store.addAuthor author
		store.addTweet tweet
	), 400)

const stopTweets = do setTimeout((do
	clearInterval(newtweets)
), 5000)

const RootStore = types.model({
	authors: types.array(Author),
	tweets: types.array(Tweet)
}).actions(do |store| 
	{
		addTweet: do |new_tweet| 
			store.tweets.push(Tweet.create new_tweet)
		addAuthor: do |new_author| 
			store.authors.push(Author.create new_author)
		removeTweet: do |tweet_id| 
			store.tweets = store.tweets.filter(do $1.id !== tweet_id)
		removeAuthor: do |author_id| 
			store.authors = store.authors.filter(do $1.id !== author_id)
		makeNewTweets,
		stopTweets
	}
)

const store = RootStore.create({
	authors: [],
	tweets: []
})

# DB PERSIST MIDDLEWARE EXAMPLE
addMiddleware(store, (do |call, next, abort|
	switch call.name
		when 'addTweet'
			console.log call.name, call.args[0]
			# DB PERSIST LOGIC HERE
		when 'addAuthor'
			console.log call.name, call.args[0]
			# DB PERSIST LOGIC HERE
		when 'removeTweet'
			console.log call.name, call.args[0]
			# DB PERSIST LOGIC HERE
		when 'removeAuthor'
			console.log call.name, call.args[0]
			# DB PERSIST LOGIC HERE

	next(call)
))

export { store }