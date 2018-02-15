push-check:
	/usr/bin/env ansible-playbook -i hosts push.yml --check --diff

push:
	sudo /usr/bin/env ansible-playbook -i hosts push.yml

pull:
	/usr/bin/env ansible-playbook -i hosts pull.yml

pull-check:
	/usr/bin/env ansible-playbook -i hosts pull.yml --check --diff

facts:
	/usr/bin/env ansible all -i hosts -m setup
