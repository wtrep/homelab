#cloud-config
autoinstall:
  version: 1
  locale: en_US
  keyboard:
    layout: en
    variant: us
  identity:
    hostname: unifi
    password: "${vm_password_hash}"
    username: ubuntu
  ssh:
    install-server: yes
    allow-pw: false
    authorized-keys:
      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAdfiVYbUOF/tzqw3lNIZ7hRKcf83cbbZVqE9lmQ4aye wil.trepanier@gmail.com
  late-commands:
    - echo 'ubuntu ALL=(ALL) NOPASSWD:ALL' > /target/etc/sudoers.d/ubuntu
