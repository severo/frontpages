from ghost import Ghost
ghost = Ghost()
ghost.open('http://lemonde.fr')
ghost.capture_to('lemonde.fr.png')
