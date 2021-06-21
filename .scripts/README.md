# Bash Scripting Directory

Remember to make scripts executable.
`$ chmod +x <script-name>`

Also, in the event this directory must be remade, in order to run scripts from this location it must be added to the $PATH variable.  It needs to be defined in the ~/.bashrc file.  It likely already has paths defined in the `export PATH...` line.  If this is the case, just add it to this line.  If it does not, it's important to add both the current paths ($PATH) as well to make sure the new doesn't override the old.

`export PATH="~/.scripts:$PATH"`
