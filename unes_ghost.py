#!./unes_ghost/bin/python
from ghost import Ghost
ghost = Ghost()
with ghost.start() as session:
    page, extra_resources = session.open("http://www.lefigaro.fr")
    assert page.http_status == 200 and 'figaro' in page.content
    session.capture_to('lefigaro.png')
