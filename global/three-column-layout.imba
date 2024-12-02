import * as PH from 'imba-phosphor-icons'
tag three-column-layout
	prop left-visible = true
	prop right-visible = true
	
	def toggleLeft
		left-visible = !left-visible
		imba.commit!
	
	def toggleRight
		right-visible = !right-visible
		imba.commit!
	<self .left-visible=left-visible .right-visible=right-visible>
		<aside.left>
			<.content>
				<slot name='left'>
			<button.toggle-btn @click=toggleLeft [flex-grow:0 flex-shrink:1]> 
				# left-visible ? "←" : "→"
				<svg src=PH.CARET_RIGHT [size:20px tween:all .2s ease]>
					if !left-visible
						css rotate:180deg
		<main>
			<slot>
		<aside.right>
			<button.toggle-btn @click=toggleRight>
				<svg src=PH.CARET_LEFT [size:20px tween:all .2s ease]>
					if !right-visible
						css rotate:180deg
			<.content>
				<slot name='right'>
	
	css self
		# 1sidebar: 300px # from global/styles
		# 1iconsize: 30px # from global/styles
		# 1speed: .5s # from global/styles
		d:flex
		h:100vh
		overflow:hidden
		ml:-1sidebar
		mr:-1sidebar
		tween:all 1speed ease
		.toggle-btn
			size:1iconsize
			cursor:pointer
			d:vtc
			pt:1sp
			bg:gray2
			h:100%
		&.left-visible
			ml:0
		&.right-visible
			mr:0sidebar
		main
			flex-grow:0
			p:2sp
		aside
			w:calc(1sidebar + 1iconsize)
			flex-shrink:0
			bg:cool0
			d:hflex
			.content
				p:2sp
				flex-grow:1