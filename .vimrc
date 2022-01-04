set ts=4 sw=4 relativenumber nohlsearch clipboard=unnamedplus

imap jk <Esc>
imap <C-D> <Esc>
imap q<Tab> {<CR>}<Esc>ko
imap pl<Tab> fmt.Println()<Esc>i
imap r<Tab> return 
imap b<Tab> break
imap c<Tab> continue
imap fi<Tab> for i := 0; i < ; i++ {<CR>}<Esc>BBBi
imap fj<Tab> for j := 0; j < ; j++ {<CR>}<Esc>BBBi
imap fk<Tab> for k := 0; k < ; k++ {<CR>}<Esc>BBBi
imap fx<Tab> for x := 0; x < ; x++ {<CR>}<Esc>BBBi
imap fy<Tab> for y := 0; y < ; y++ {<CR>}<Esc>BBBi
imap fz<Tab> for z := 0; z < ; z++ {<CR>}<Esc>BBBi
imap go<Tab> package main<CR><CR>func main() {<CR>}<CR><Esc>kko
imap hi<Tab> package main<CR><CR>import "fmt"<CR><CR>func main() {<CR>fmt.Println("Hello World!")<CR>}<CR><Esc>kkA

command W :w

command! F :silent call FormatFile()
:function FormatFile()
:	w
:	!go fmt %:t
:	e
:endfunction

command! R call GoRunFile()
:function GoRunFile()
:	w
:	!go fmt %:t
:	e
:	!go run %:t
:endfunction

command! T call GoTestFile()
:function GoTestFile()
:	w
:	!go fmt %:t
:	e
:	!go test %:t
:endfunction

command! FF :silent call Format()
:function Format()
:	bufdo :w
:	!go fmt
:	bufdo :e
:endfunction

command! RR call GoRun()
:function GoRun()
:	bufdo :w
:	!go fmt
:	bufdo :e
:	!go run .
:endfunction

command! TT call GoTest()
:function GoTest()
:	bufdo :w
:	!go fmt
:	bufdo :e
:	!go test
:endfunction

