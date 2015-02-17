UltiSnipsEnableSnipMate #1
UltiSnipsJumpForwardTrigger  <c-j>
UltiSnipsRemoveSelectModeMappings #1
UltiSnipsUsePythonVersion  <tab>
__textobj_indent      {'obj_specs': {'same': {'select-i-function': 'textobj#indent#select_same_i', 'select-a': ['aI'], 'select-a-function': 'textobj#indent#select_same_a', 'select-i': ['iI']}, '-': {'select-i-function': 'textobj#indent#select_i', 'select-a': ['ai'], 'select-a-function': 'textobj#indent#select_a', 'select-i': ['ii']}}, 'define_default_key_mappings': function('7'), 'name': 'indent', 'do_by_function': function('11'), 'interface_mapping_name': function('9'), 'normalize': function('6'), 'do_by_pattern': function('10'), 'define_interface_key_mappings': function('8'), 'new': function('5')}
__textobj_lastpat     {'obj_specs': {'N': {'select': ['a?', 'i?'], 'sfile': '/Users/ashkan/Workspace/dotfiles/nvimfiles/vim/cobalt/kana.vim-textobj-lastpat/plugin/textobj/lastpat.vim', 'select-function': '<80><fd>Q77_select_N'}, 'n': {'select': ['a/', 'i/'], 'sfile': '/Users/ashkan/Workspace/dotfiles/nvimfiles/vim/cobalt/kana.vim-textobj-lastpat/plugin/textobj/lastpat.vim', 'select-function': '<80><fd>Q77_select_n'}}, 'define_default_key_mappings': function('7'), 'name': 'lastpat', 'do_by_function': function('11'), 'interface_mapping_name': function('9'), 'normalize': function('6'), 'do_by_pattern': function('10'), 'define_interface_key_mappings': function('8'), 'new': function('5')}
airline_detect_iminsert #0
airline_exclude_preview #0
airline_left_sep       
airline_powerline_fonts #1
airline_right_sep      
airline_section_a      %#__accent_bold#%{airline#util#wrap(airline#parts#mode(),0)}%#__restore__#%{airline#util#append(airline#parts#paste(),0)}%{airline#util#append("",0)}%{airline#util#append(airline#parts#iminsert(),0)}
airline_section_b      %{airline#util#wrap(airline#extensions#hunks#get_hunks(),0)}%{airline#util#wrap(airline#extensions#branch#get_head(),0)}
airline_section_c      %<%f%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#
airline_section_x      %{airline#util#prepend(airline#extensions#tagbar#currenttag(),0)}%{airline#util#wrap(airline#parts#filetype(),0)}
airline_section_y      %{airline#util#wrap(airline#parts#ffenc(),0)}
airline_section_z      %3p%% %{g:airline_symbols.linenr}%#__accent_bold#%4l%#__restore__#:%3v 
airline_symbols       {'linenr': '', 'paste': 'PASTE', 'readonly': '', 'modified': '+', 'space': ' ', 'whitespace': '✹', 'branch': ''}
argumentobject_force_toplevel #0
arpeggio_timeoutlens  {}
ctrlp_use_caching     #0
ctrlp_user_command     ag %s -l --nocolor -g ""
did_UltiSnips_autoload #1
did_UltiSnips_snipmate_compatibility #1
did_load_filetypes    #1
fugitive_browse_handlers [function('<SNR>85_github_url'), function('<SNR>85_instaweb_url')]
fugitive_summary_format  %s
gitgutter_eager       #1
gitgutter_enabled     #1
gitgutter_escape_grep #0
gitgutter_realtime    #1
gitgutter_sign_column_always #0
gitgutter_sign_removed_first_line  ‾
loaded_2html_plugin    vim7.4_v1
loaded_getscriptPlugin  v36
loaded_gzip           #1
loaded_operator_replace #1
loaded_remote_plugins #1
loaded_sensible       #1
loaded_smartgf        #1
loaded_spellfile_plugin #1
loaded_surround       #1
loaded_tarPlugin       v29
loaded_textobj_entire #1
loaded_textobj_gitgutter #1
loaded_vimproc        #1
loaded_zipPlugin       v27
rails_mappings        #0
smartgf_auto_refresh_ctags #1
smartgf_grep_prog      ag
smartgf_key            gf
smartgf_tags_file      .smartgf_tags
tabular_loaded        #1
tagbar_hide_nonpublic #0
tagbar_indent         #2
tagbar_left           #0
tagbar_map_closefold  ['-', '<kMinus>', 'zc']
tagbar_map_openfold   ['+', '<kPlus>', 'zo']
tagbar_map_prevfold    zk
tagbar_map_prevtag     <C-P>
tagbar_map_togglefold ['o', 'za']
tagbar_previewwin_pos  topleft
tagbar_singleclick    #0
tagbar_vertical       #0
unite_force_overwrite_statusline #0
unite_source_grep_command  ag
unite_source_grep_recursive_opt  
unite_source_history_yank_limit #100
unite_source_history_yank_save_clipboard #0
unite_source_session_enable_auto_save #1
user_emmet_leader_key  <c-y>
x                      b
ycm_auto_start_csharp_server #1
ycm_auto_stop_csharp_server #1
ycm_autoclose_preview_window_after_insertion #0
ycm_collect_identifiers_from_comments_and_strings #0
ycm_collect_identifiers_from_tags_files #0
ycm_complete_in_comments #0
ycm_complete_in_strings #1
ycm_confirm_extra_conf #1
ycm_extra_conf_vim_data []
ycm_filetype_blacklist {'notes': 1, 'markdown': 1, 'unite': 1, 'tagbar': 1, 'pandoc': 1, 'qf': 1, 'vimwiki': 1, 'text': 1, 'infolog': 1, 'mail': 1}
ycm_filetype_specific_completion_to_disable {'gitcommit': 1}
ycm_key_invoke_completion  <C-Space>
ycm_key_list_previous_completion ['<S-TAB>', '<Up>']
ycm_max_diagnostics_to_display #30
ycm_min_num_of_chars_for_completion #2
ycm_open_loclist_on_ycm_diags #1
ycm_seed_identifiers_with_syntax #0
ycm_server_log_level   info
ycm_show_diagnostics_ui #1
