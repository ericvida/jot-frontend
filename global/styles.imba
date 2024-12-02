import 'imba/preflight.css'
import './three-column-layout.imba'
# GLOBAL STYLES ONLY
global css 
	@root
		hue:indigo
		1sp: 8px
		1sidebar: 300px
		1iconsize: 30px
		1speed: .5s
		1rd: 5px
	* 
		box-sizing:border-box
		tween: all 1speed ease
	html
		overflow:hidden