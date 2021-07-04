source "vmware-iso" "unifi" {
  iso_url      = "http://ubuntu-cd.mirror.iweb.ca/20.04/ubuntu-20.04.2-live-server-amd64.iso"
  iso_checksum = "sha256:d1f2bf834bbe9bb43faf16f9be992a6f3935e65be0edece1dee2aa6eb1767423"

  ssh_username           = "ubuntu"
  ssh_agent_auth         = true
  ssh_certificate_file   = "~/.ssh/id_ed25519"
  ssh_pty                = true
  ssh_timeout            = "20m"
  ssh_handshake_attempts = "100" # Workaround since SSH is opened during the installation

  shutdown_command = "sudo -S shutdown -P now"

  guest_os_type = "ubuntu-64"
  cpus          = var.cpus
  memory        = var.memory
  cores         = var.cores
  network_name  = var.network_name

  remote_type     = "esx5"
  remote_host     = var.remote_host
  remote_username = var.remote_username
  remote_password = var.remote_password # Needed by ovftool

  vnc_over_websocket  = true # ESXi 7.0
  insecure_connection = true # Self signed certificate

  boot_wait = "5s"
  boot_command = [
    "<enter><enter><f6><esc><wait>",
    "autoinstall ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/",
    "<enter><wait>"
  ]

  http_content = {
    "/meta-data" = file("http/meta-data")
    "/user-data" = templatefile("http/user-data.pkrtpl.hcl", { vm_password_hash = var.vm_password_hash })
  }
}

build {
  sources = ["sources.vmware-iso.unifi"]

  provisioner "shell" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get upgrade -y",
      "sudo apt-get install ansible -y"
    ]
  }
}
