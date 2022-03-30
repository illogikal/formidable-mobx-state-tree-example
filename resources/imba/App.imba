import { props } from './props'
import { Home } from './pages/Home'
import { About } from './pages/About'
import { Tweets } from './pages/Tweets'
import { store } from '../../storage/framework/tree'

export tag App
	<self[ff:Nunito ta:center]>
		<nav[p:7 fs:large]>
			<a[fw:bold] route-to="/$"> "Home"
			" | "
			<a[fw:bold] route-to="/about"> "About"
			" | "
			<a[fw:bold] route-to="/tweets"> "Tweets"

		<Home route="/$">
		<About route="/about">
		<Tweets route="/tweets" store=store>
