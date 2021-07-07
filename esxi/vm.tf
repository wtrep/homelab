resource "esxi_guest" "unifi" {
  guest_name     = "unifi"
  disk_store     = "datastore1"
  ovf_source     = "../images/unifi/output-unifi/packer-unifi.ovf"
  boot_disk_type = "thin"
  power          = "on"

  network_interfaces {
    virtual_network = "VM Network"
    nic_type        = "vmxnet3"
  }
}
