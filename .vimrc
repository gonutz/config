" 4 space tabs and relative numbers with the current line numbered absolute.
" Also always use the system clipboard.
set ts=4 sw=4 number relativenumber nohlsearch clipboard=unnamedplus nofixendofline nowrap
set path+=**
set ignorecase

" Trying out jk and Ctrl+D for Escape.
imap jk <Esc>
imap <C-D> <Esc>

nnoremap d "_d
vnoremap d "_d
nmap <C-P> diwP

" These are some go code snippets to be inserted on <abbreviation><Tab>:
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
imap t<Tab> func Test(t *testing.T) {<CR>}<Esc>BBbbi
imap ce<Tab> check.Eq(t, )<Esc>i

" These are some Delphi code snippets to be inserted on <abbreviation><Tab>:
imap p<Tab> procedure ;<Esc>i
imap f<Tab> function ;<Esc>i

" W = w
command W :w

" :C calls clean script.
command! C :silent call CleanWithScript()
:function CleanWithScript()
:	!clean
:endfunction

" :F to format current file.
command! F :silent call FormatWithScript()
:function FormatWithScript()
:	w
:	!format %:t
:	e
:endfunction

" :FF to format all files.
command! FF :silent call FormatAllWithScript()
:function FormatAllWithScript()
:	bufdo :w
:	!format
:	e
:endfunction

" :F to format current go file.
autocmd FileType go command! F :silent call FormatGoFile()
:function FormatGoFile()
:	w
:	!go fmt %:t
:	e
:endfunction

" :FF to format all go files in this directory.
autocmd FileType go command! FF :silent call FormatAllGoFiles()
:function FormatAllGoFile()
:	bufdo :w
:	!go fmt
:	e
:endfunction

" :B to run build script for the current file.
" TODO Handle arguments, e.g. :B release to call build_release instead of
" build.
command! B call BuildWithScript()
:function BuildWithScript()
:	w
:	!build %:t
:endfunction

" :BB to run build script without arguments.
" This is to build the current directory.
command! BB call BuildAllWithScript()
:function BuildAllWithScript()
:	bufdo :w
:	build
:endfunction

" :R to call the run script on the current file.
command! R call RunWithScript()
:function RunWithScript()
:	w
:	!run %:t
:	e
:endfunction

" :RR to call the run script.
command! RR call RunAllWithScript()
:function RunAllWithScrit()
:	bufdo :w
:	!go fmt
:	e
:	!go run .
:endfunction

" :RR to call the run script.
autocmd FileType go command! RR call GoRun()
:function GoRun()
:	bufdo :w
:	!go fmt
:	e
:	!go run .
:endfunction

" :R to run the current go file.
autocmd FileType go command! R call RunGoFile()
:function RunGoFile()
:	w
:	!go fmt %:t
:	e
:	!go run %:t
:endfunction

command! T call TestFile()
:function TestFile()
:	w
:	!test %:t
:endfunction

command! TT call TestAll()
:function TestAll()
:	bufdo :w
:	!test
:endfunction

autocmd FileType go command! T call GoTestFile()
:function GoTestFile()
:	w
:	!go fmt %:t
:	e
:	!go test %:t
:endfunction

autocmd FileType go command! TT call GoTest()
:function GoTest()
:	bufdo :w
:	!go fmt
:	e
:	!go test
:endfunction

