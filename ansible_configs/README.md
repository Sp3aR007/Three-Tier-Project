This Ansible playbook automates the configuration of three-tier application infrastructure. It handles server provisioning and building docker images.

# Run the playbook

## For frontend instances

```
ansible-playbook -i inventory.ini frontend-playbook.yaml
```

## For backend instances

```
ansible-playbook -i inventory.ini backend-playbook.yaml
```

