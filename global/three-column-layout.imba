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
				<svg src=PH.CARET_RIGHT>
					if !left-visible
						css rotate:180deg
		<main>
			<slot>
		<aside.right>
			<button.toggle-btn @click=toggleRight>
				<svg src=PH.CARET_LEFT>
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
		tween:all 1speed ease
		w:calc(100vw + (2sidebar))
		ml:-1sidebar
		&.left-visible
			ml:0
			w:calc(100vw + (1sidebar))
		&.right-visible
			w:calc(100vw + (1sidebar))
		&.right-visible.left-visible
			ml:0
			w:calc(100vw)
		pos:relative
		.toggle-btn
			size:1iconsize
			cursor:pointer
			d:vtc
			# fls:0
			bg:white @hover:gray2
			of:hidden
			svg
				size:1iconsize
				p:.3sp
				>>> stroke:cool4
					stroke-width:25px
	css main
			flex:1
			min-w:0
			p:2sp
			of:auto
	css aside
			d:hflex
			overflow:hidden
			.content
				overflow-y:auto
				w:1sidebar
				bg:cool0
				p:2sp
				flex-grow:1