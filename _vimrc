" 플랫폼 공통 vim 설정파일
" 목적 1: OS X, Linux, Windows 플랫폼의 vim 사용 환경 공용화.
" 목적 2:​ OS 업데이트, 재설치 시 번거로운 vimrc 재편집 과정 최소화.
" 마지막 수정일: 2015-07-19

"-----------------------------------------
" 0. Vim vundle environment configuration
"-----------------------------------------
"vundle.vim 설치 후에 다음 설정이 적용됨
"vundle.vim 설치는 터미널에서 다음 명령어 입력 통해서
"git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

set nocompatible                "vi 호환성 무시. 방향키 사용. vundle 사용 시 필수.
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim' "required
Plugin 'tpope/vim-fugitive' "required
call vundle#end()
filetype plugin indent on " Put your non-Plugin stuff after this line

"-----------------------------------------
" 1. Common vim environment configuration
"-----------------------------------------
" Line number
set nu

" Indent (들여쓰기)
set autoindent
set cindent
"set smartindent
set paste                        "indent에 의한 복사 붙여넣기 시 들여쓰기 계단현상방지

" Use of Navigation key
"vundl 설정과 중복되어 주석 처리"
"set nocompatible                 "방향키 사용함. vim 기본설정.

" Tab, shift and text width
set tabstop=4                    "tab을 4칸으로
set shiftwidth=4                 "shift를 4칸으로
set textwidth=80                 "한 줄 80자 제한
"set expandtab                   "tab 대신 띄어쓰기
set wmnu                         "tab 자동완성시 가능한 목록을 보여줌

" Search
set ignorecase                   "검색시 대소문자 구분하지 않음
set incsearch                    "검색 패턴 입력 중에 일치하는 문자열로 커서 이동"
set hlsearch                     "검색결과 하이라이트
set nowrapscan                   "검색 시, 현 위치에서 파일끝까지만 검색할 것.

"Character encoding
set en=UTF-8
set fileencodings=UTF-8

"Miscellaneas
set nobackup                     "no backup file
set autowrite                    "next나 make 며령 시 자동저장
set bs=indent,eol,start          "backspace키 줄처음에 위치한 경우 상위줄과 합침
set showcmd                      "부분적인 명령어 상태 라인 보이기
set showmatch                    "매치되는 괄호 반대쪽 보이기
set title                        "타이틀 바에 현재 편집 중인 파일 표시
set ruler                        "상태표시줄에 커서의 위치 표시
set bg=dark                      "검정색 배경. 터미널 및 콘솔 사용 환경 고려함
set warn                         "저장하지 않고 vim 종료 시 경고 메시지 출력력
syntax on                        "문법 하이라이트
"set nojinspaces                  "J명령 시 한칸 띄고 붙임

"-----------------------------------------
" 2. ctags database path configuration
"-----------------------------------------
"vim 사용중인 플랫폼 - linux, OS X, window -에 맞게 변경할 것
"예제"
"set tags=/home/code/src/linux/tags"

"-----------------------------------------
" 3. cscope database path configuration
"-----------------------------------------
"cscope path: 사용중인 플랫폼 설정에 맞게 변경할 것
"예제"
"set csprg=/usr/local/Cellar/cscope/15.8a/bin$
"set csto=0                       "cscope DB search first
"set cst                          "cscope DB tag DB search
"set nocsverb                     "verbose off

"cscope DB path: 사용중인 플랫폼에 맞게 변경할 것
"예제"
"cs add /home/code/src/linux/cscope.out
"set csverb

"-----------------------------------------
" 4. Tag List environment configuration
"-----------------------------------------
"vim file type on"
"filetype on                      "vundle.vim 사용 시 filetype off 설정 필요함

"Tag List toggling key = F7"
nmap <F7> : TlistToggle<CR>

"ctag binary file path"
let Tlist_Ctags_Cmd = "/usr/bin/ctags"

"Window Widtah Change
let Tlist_Inc_Winwidth = 0       "window width change off
let Tlist_Exit_OnlyWindow = 0    "tag/file 선택 완료 시 taglist window close = off

" Tag List Auto
let Tlist_Auto_Open = 0
let Tlist_Use_Right_Window = 1

"----------------------------------------------
" 5. Source Explorer environment configuration
"----------------------------------------------
nmap <F8> :SrcEXplToggle<CR>     "SrcExpl toggling key = F8

"윈도우 간 이동키 설정
nmap <C-H> <C-W>h                "왼쪽 창으로 이동
nmap <C-J> <C-W>j                "하단(preview) 창으로 이동
nmap <C-K> <C-W>k                "상단 창으로 이동
nmap <C-L> <C-W>l                "오른쪽 창으로 이동

let g:SrcExpl_winHeight = 8      "SrcEXpl 윈도우 높이 지정
let g:SrcExpl_refreshTime = 100  "Refreshing time = 100msec"
"해당 definition으로 jump시키려면 엔터키 입력"
let g:SrcExpl_jumpKey = "<ENTER>"
"Definition에서 호출부/구현부로 원복하려면 스페이스 키 입력"
let g:SrcExpl_gobackKey = "<SPACE>"
let g:SrcExpl_isUpdateTags = 0   "Tag file update off

"----------------------------------------------
" 6. NERD Tree environment configuration
"----------------------------------------------
let NERDTreeWinPos = "left"      "NERD Tree 위치는 왼쪽
nmap <F9> :NERDTreeToggle<CR>    "NERD Tree toggling key = F9
