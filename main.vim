let s:words = ["a", "b", "c", "d"]
fu! Increment(by)
	let tempRegisterB=@b
	try
		"save current word and map it to register b"
		:normal! "byiw
		let currentWord=@b
		if index(s:words, currentWord) < 0
			:normal! 
			return|"found no match"
		endif
		let idx = (index(s:words, currentWord) + a:by) % len(s:words)
		let nextWord = s:words[idx]
		let @b=nextWord
		:normal! viw"bp
	finally
		let @b=$tempRegisterB
	endtry
endfunction

:nnoremap <buffer> <C-a> :call Increment(1)<CR>
:nnoremap <buffer> <C-x> :call Increment(-1)<CR>


