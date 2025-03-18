# /etc/cshrc
#
# csh configuration for all shell invocations.

# Set default umask for non-login shell only if it is set to 0
if ( `umask` == 0 ) then
    umask 022
endif

if ($?prompt) then
  if ($?tcsh) then
    set promptchars='$#'
    set prompt='[%n@%m %c]%# '
    # make completion work better by default
    set autolist
  else
    set prompt=\[$user@`/usr/bin/hostname`\]\$\ 
  endif
endif

if ( $?tcsh ) then
	bindkey "^[[3~" delete-char
endif

bindkey "^R" i-search-back
set echo_style = both
set histdup = erase
set savehist = (1024 merge)

if ($?prompt) then
  if ($?TERM) then
    switch($TERM)
      case xterm*:
        if ($?tcsh) then
	  set prompt='%{\033]0;%n@%m:%c\007%}[%n@%m %c]%# '
        endif
        breaksw
      case screen:
        if ($?tcsh) then
          set prompt='%{\033k%n@%m:%c\033\\%}[%n@%m %c]%# '
        endif
        breaksw
      default:
        breaksw
    endsw
  endif
endif

setenv MAIL "/var/spool/mail/$USER"

# Check if we aren't a loginshell and do stuff if we aren't
if (! $?loginsh) then
    if ( -d /etc/profile.d ) then
        set nonomatch
        foreach i ( /etc/profile.d/*.csh )
            if ( -r "$i" ) then
                if ($?prompt) then
                    source "$i"
                else
                    source "$i" >&/dev/null
                endif
            endif
        end
        unset i nonomatch
    endif
endif

#Synopsys
setenv SYNOPSYS /opt/synopsys
setenv LD_LIBRARY_PATH /usr/lib64:/usr/lib:/lib64:/lib:/usr/lib	
setenv EDITOR vi


setenv LM_LICENSE_FILE 27020@192.168.118.26
setenv SNPSLMD 27020@192.168.118.26

#IC Compiler II; icc2_shell -gui
set path =($path /opt/synopsys/icc2/U-2022.12-SP6/bin)

#Prime Time Suite; pt_shell -gui
set path =($path /opt/synopsys/prime/W-2024.09-SP3/bin) 

#VCS U-2023.03-SP2-9, vcs -help
setenv VCS_HOME /opt/synopsys/vcs/U-2023.03-SP2-9
setenv VCS_TARGET_ARCH linux64
setenv VCS_LIC_EXPIRE_WARNING 0
set path =($path $VCS_HOME/bin)

#Verdi U-2023.03-SP2-9, verdi, verdi-Apex
setenv VERDI_HOME /opt/synopsys/verdi/U-2023.03-SP2-9
setenv VERDI_LIB $VERDI_HOME/share/PLI/VCS/LINUX64
set path =($path $VERDI_HOME/bin)

#Library Compiler, lc_shell
setenv SYNOPSYS_LC_ROOT /opt/synopsys/lc/U-2022.12-SP6
setenv SYNOPSYS_SYN_ROOT /opt/synopsys/syn/U-2022.12-SP6
set path =($path $SYNOPSYS_LC_ROOT/bin $SYNOPSYS_SYN_ROOT/bin)

#Design Compiler (Synthesis) dc_shell, design_vision
set path =($path /opt/synopsys/syn/U-2022.12-SP7-3/bin)

