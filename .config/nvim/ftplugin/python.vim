let g:flake8_max_line_length=100                                                                                                                                                  
setlocal softtabstop=4                                                                                                                                                            
setlocal shiftwidth=4                                                                                                                                                             
setlocal textwidth=99                                                                                                                                                             
setlocal expandtab                                                                                                                                                                
setlocal fileformat=unix                                                                                                                                                          
set encoding=utf-8                                                                                                                                                                
match BadWhitespace /\s\+$/                                                                                                                                                       
let python_highlight_all=1                                                                                                                                                        
py << EOF                                                                                                                                                                         
import os                                                                                                                                                                         
import sys                                                                                                                                                                        
if 'VIRTUAL_ENV' in os.environ:                                                                                                                                                   
  project_base_dir = os.environ['VIRTUAL_ENV']                                                                                                                                    
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')                                                                                                          
  execfile(activate_this, dict(__file__=activate_this))                                                                                                                           
EOF
