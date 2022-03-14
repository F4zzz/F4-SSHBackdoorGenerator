# F4-SSHBackdoorGenerator

0. Verifica as permissoes do usuario atual para saber se pode ler as keys encontradas, criar novas keys, ler/modificar arquivos de configuracao em /etc/ssh.

1. Procura por ssh keys nos usuarios em /home:
(.ssh/authorized_keys .ssh/identity.pub .ssh/identity .ssh/id_rsa.pub .ssh/id_rsa .ssh/id_dsa.pub .ssh/id_dsa)

2. Procura por arquivos de configuracao de ssh em /etc/ssh:
(/etc/ssh/ssh_config /etc/ssh/sshd_config /etc/ssh/ssh_host_dsa_key.pub /etc/ssh/ssh_host_dsa_key /etc/ssh/ssh_host_rsa_key.pub /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_key.pub /etc/ssh/ssh_host_key)

3. Opcao de substituir os arquivos de configuracao encontrados por arquivos que voce criar:
(para isso vc precisa criar um arquivo de nome igual ao que vc quer substituir, como deixei de exemplo o arquivo ./sshd_config)

4. Opcao de gerar uma ssh key para seu usuario atual.


