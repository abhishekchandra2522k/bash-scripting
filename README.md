# bash-scripting

NOTE: The repository structured for the scriptbox VM. All the bash scripts were/can be placed in /opt/scripts directory into the scriptbox VM

_See Vagranfile for more information on the below VM configurations_

**scriptbox**: CENTOS VM (main VM, from where we are running all the scripts and connecting to other VMs using ssh connection)

**web01**: CENTOS VM

**web02**: CENTOS VM

**web03**: UBUNTU VM

### General Notes:

- Make sure to make the script executable (`chmod +x <file-name>.sh`) to be able to execute the script from the shell.
- `./<filname>.sh` to execute the script.
- `nohup <command>` to execute the command in the background.
- `<command> > /dev/null` to generate no output.
- Once we connect to a VM using SSH for the first time, it asks for permission to store a fingerprint - SHA256:`<fingerprint>`, that file is `~/.ssh/known_hosts`.
- To remove all the known hosts (means it will ask for the permission to store the fingerprint once you try to SSH into the machine again) use - `cat /dev/null > ~/.ssh/known_hosts`

#### Generating SSH Keys

- `ssh-keygen`: It will generate two keys -- One is the Public Key (stored at /root/.ssh/id_rsa.pub) and other is the Private Key (stored at /root/.ssh/id_rsa). Public Key acts as a lock and Private Key as the key to establish the connection.

- `ssh-copy-id devops@web01`: General -> `ssh-copy-id <user>@<hostname>` this will apply the ssh login authentication instead of the password based authentication on the user devops and host web01.

- `vim /etc/ssh/sshd_config`: Update this file in UBUNTU to enable password based authentication first. Then only we can apply the key based authentication using the `scriptbox` VM.

- The below command can be used to execute commands remotely from the scriptbox VM on web01, web02, web03. (Make sure the local host entry has been made with `<IP> <HOSTNAME>`, for example `192.168.10.52 web01`)

  - $ `` for host in `cat remote_hosts`; do ssh devops@$host uptime; done ``
