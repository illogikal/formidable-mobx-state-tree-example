import { hasAttr } from '@formidablejs/view'
import { isWaiting } from '@formidablejs/view'
import { readProps } from '@formidablejs/view'

let props = { }

export tag Props
	def render
		<self>
			if isWaiting(props) && hasAttr(self) then props = readProps(self)

		imba.commit!

export { props }
