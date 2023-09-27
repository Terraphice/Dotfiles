function lsr --wraps='ls -r' --wraps='ls -R' --description 'alias lsr ls -R'
  ls -R $argv
        
end
