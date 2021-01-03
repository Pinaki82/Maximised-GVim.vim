" ============================================
"  ******************************************
" ============================================
" http://vi.stackexchange.com/questions/2572/detect-os-in-vimscript
" google: detecting os from vimscript
if !exists("g:osdetected")
    if has("win64") || has("win32") || has("win16") || has("win32unix")
        let g:osdetected = "Windows"
    elseif has("macunix")
        let g:osdetected = substitute(system('uname'), '\n', '', '')
    else
        let g:osdetected = substitute(system('uname'), '\n', '', '')
    endif
endif
" ============================================


" https://vi.stackexchange.com/questions/1937/how-do-i-get-gvim-to-start-maximised-in-windows
" https://superuser.com/questions/419372/how-do-i-set-the-default-window-size-in-vim
if has("gui_running")
  " GUI is running or is about to start.
  " Maximise gvim window.
  if g:osdetected == "Windows"
    if v:version < 802 " https://stackoverflow.com/questions/11774904/vim-scripting-if-vim-version-is-7-3
        :echo "Version 8.02 or above required."
    else
        autocmd GUIEnter * simalt ~x
    endif
  endif
  " ============================================
  " Starts GVim Maximised (UBUNTU)
  " https://coderwall.com/p/r4jpqq
  " Install required lib
  " sudo apt install wmctrl
  " -------------------------------
  if g:osdetected == "Linux"
    if v:version < 801 " https://stackoverflow.com/questions/11774904/vim-scripting-if-vim-version-is-7-3
    :echo "Version 8.01 or above required."
    else
        function Maximise_Window()
            silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
        endfunction
        au GUIEnter * call Maximise_Window()
    endif
  endif
endif
