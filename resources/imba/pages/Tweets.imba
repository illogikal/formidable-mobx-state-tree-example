
export tag Tweets
	prop store
	<self>
		<h1> "This is an about page"
		<div [d:flex jc:center]>
			<div>
				<h2> 'Tweets'
				<table>
					<tr>
						<th> 'id' 
						<th> 'author' 
						<th> 'body' 
						<th> 'timestamp' 
						<th> 
					for tweet in store.tweets
						<tr>
							<td> "{tweet.id}"
							<td> "{tweet.author_name}"
							<td> "{tweet.body}"
							<td> "{tweet.timestamp}"
							<td> <button @click=store.removeTweet(tweet.id)> 'Remove'
			<div [flb:300px]>
			<div>
				<h2> 'Authors'
				<table>
					<tr>
						<th> 'id' 
						<th> 'firstName' 
						<th> 'lastName' 
						<th> 
					for author in store.authors
						<tr>
							<td> "{author.id}"
							<td> "{author.firstName}"
							<td> "{author.lastName}"
							<td> <button @click=store.removeAuthor(author.id)> 'Remove'

