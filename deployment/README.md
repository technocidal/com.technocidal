# com.technocidal-deployment

Ansible playbook to deploy services/sites running on technocidal.com

## Install Ansible

```bash
# Create a virtualenv
python3 -m venv ~/.venv/com-technocidal-deployment

# Activate the virtualenv
source ~/.venv/com-technocidal-deployment/bin/activate

# Install Ansible
pip install ansible

# Deactivate the virtualenv (after your work)
deactivate
```

> Credit: [while-true-do.io](https://blog.while-true-do.io/fedora-home-server-automation)

## Usage

Install all 3rd party roles this playbook uses.

```bash
ansible-galaxy install -r requirements.yml
```

Create an inventory (`inventory.ini`) to define which machines you're targeting.

Execute the following command to deploy `run.yml`.

```bash
ansible-playbook run.yml
```

## Vault

Create a new keychain item for vault decryption.

```bash
security add-generic-password -a $USER -s ansible-vault-password -w [PASSWORD]
```

Edit variables in vault.

```bash
ansible-vault edit vars/vault.yml
```
