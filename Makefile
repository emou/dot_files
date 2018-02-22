push-check:
	/usr/bin/env ansible-playbook -i hosts push.yml --check --diff

push:
	/usr/bin/env ansible-playbook -i hosts push.yml

cpp:
	/usr/bin/env ansible-playbook -i hosts cpp.yml

snaps:
	/usr/bin/env ansible-playbook -i hosts snaps.yml

pull:
	/usr/bin/env ansible-playbook -i hosts pull.yml

pull-check:
	/usr/bin/env ansible-playbook -i hosts pull.yml --check --diff

facts:
	/usr/bin/env ansible all -i hosts -m setup
