{
  "builders": [
    {
      "type": "azure-arm",
      "client_id": "{{user `client_id`}}",
      "client_secret": "{{user `client_secret`}}",
      "tenant_id": "{{user `tenant_id`}}",
      "subscription_id": "{{user `subscription_id`}}",
      "resource_group_name": "{{user `resource_group_name`}}",
      "storage_account": "{{user `storage_account`}}",
      "container_name": "{{user `container_name`}}",
      "image_name": "{{user `image_name`}}",
      "os_type": "Linux",
      "image_publisher": "Canonical",
      "image_offer": "UbuntuServer",
      "image_sku": "20.04-LTS",
      "location": "{{user `location`}}",
      "size": "Standard_DS1_v2",
      "communicator": "ssh",
      "ssh_username": "{{user `ssh_username`}}",
      "ssh_password": "{{user `ssh_password`}}",
      "ssh_private_key_file": "{{user `ssh_private_key_file`}}"
    }
  ],
  "provisioners": [
    {
      "type": "shell",
      "inline": [
        "chmod +x ./scripts/provision.sh",
        "./scripts/provision.sh"
      ]
    },
    {
      "type": "ansible",
      "playbook_file": "ansible/playbooks/harden.yml"
    }
  ],
  "post-processors": [
    {
      "type": "azure-arm-image",
      "output_image_name": "{{user `image_name`}}",
      "os_type": "Linux"
    }
  ]
}