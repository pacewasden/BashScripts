# This command will filter out any of the _ underscore prefixed daemon users, which are not actually user accounts. 
# You’ll get a much shorter list of user names returned as a result, but you’ll still find three user names 
# included that are not typical user accounts, but are normal to be found on Mac OS X installs; daemon, nobody, and root.

dscl . list /Users | grep -v '_'



